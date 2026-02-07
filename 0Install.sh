db=~/db
mkdir -p ${db} && cd ${db}
soft=~/miniconda3
PATH=${soft}/bin:${soft}/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${db}/EasyMicrobiome/linux:${db}/EasyMicrobiome/script
echo $PATH
cd ${db}
wget https://github.com/YongxinLiu/EasyMetagenome/archive/refs/tags/v1.24.zip
mv v1.24.zip emeta.zip
unzip emeta.zip
mv EasyMetagenome-1.24 EasyMetagenome
wget https://github.com/YongxinLiu/EasyMicrobiome/archive/refs/tags/v1.24.zip
mv v1.24.zip emicro.zip
unzip emicro.zip
mv EasyMicrobiome-1.24 EasyMicrobiome
chmod +x `pwd`/EasyMicrobiome/linux/* `pwd`/EasyMicrobiome/script/*
echo "export PATH=\"\$PATH:`pwd`/EasyMicrobiome/linux:`pwd`/EasyMicrobiome/script\"" >> ~/.bashrc
source ~/.bashrc
echo $PATH
wget -c https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -f 
~/miniconda3/condabin/conda init
eval "$($HOME/miniconda3/bin/conda shell.bash hook)"
conda -V
python --version
conda config --add channels bioconda
conda config --add channels conda-forge
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda config --show-sources
conda install mamba -c conda-forge -c bioconda -y
conda install pandas -c conda-forge -c bioconda -y
conda install conda-pack -c conda-forge -c bioconda -y
conda env list
s=kneaddata
wget -c ftp://download.nmdc.cn/tools/conda/${s}.tar.gz
soft=~/miniconda3
mkdir -p ${soft}/envs/${s}
tar -xvzf ${s}.tar.gz -C ${soft}/envs/${s}
conda activate ${s}
conda unpack
fastp --version
kneaddata --version
bowtie2 --version
fastqc -v
trimmomatic -version
multiqc --version
kneaddata_database
