FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

# Expose 8888 for possible jupyter use
EXPOSE 8888

##########
# System #
##########

# Update system
RUN apt-get update
RUN apt-get upgrade -y

# Installing system packages
RUN apt -y install wget
RUN apt -y install git
RUN apt -y install cmake
RUN apt -y install python3
RUN apt -y install python3-pip
# Links python to python3 command
RUN apt -y install python-is-python3
RUN apt -y install libblas-dev liblapack-dev gfortran libpng-dev python3-dev

# Update PIP
RUN pip install --upgrade pip

###############
# Allen Atlas #
###############

# Download and store the allen atlas
RUN mkdir /var/allan_atlas
RUN mkdir /var/allan_atlas/10
RUN mkdir /var/allan_atlas/25
RUN mkdir /var/allan_atlas/50
RUN mkdir /var/allan_atlas/100

# --no-check-certificate is needed, wget won't accept root certificate
RUN wget -O average_template.nrrd -P /var/allen_atlas/10 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/average_template/average_template_10.nrrd --no-check-certificate
RUN wget -O average_template.nrrd -P /var/allen_atlas/25 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/average_template/average_template_25.nrrd --no-check-certificate
RUN wget -O average_template.nrrd -P /var/allen_atlas/50 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/average_template/average_template_50.nrrd --no-check-certificate
RUN wget -O average_template.nrrd -P /var/allen_atlas/100 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/average_template/average_template_100.nrrd --no-check-certificate

RUN wget -O ara_nissl.nrrd -P /var/allen_atlas/10 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ara_nissl/ara_nissl_10.nrrd --no-check-certificate
RUN wget -O ara_nissl.nrrd -P /var/allen_atlas/25 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ara_nissl/ara_nissl_25.nrrd --no-check-certificate
RUN wget -O ara_nissl.nrrd -P /var/allen_atlas/50 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ara_nissl/ara_nissl_50.nrrd --no-check-certificate
RUN wget -O ara_nissl.nrrd -P /var/allen_atlas/100 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ara_nissl/ara_nissl_100.nrrd --no-check-certificate

RUN wget -O annotation.nrrd -P /var/allen_atlas/10 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/annotation/ccf_2017/annotation_10.nrrd --no-check-certificate
RUN wget -O annotation.nrrd -P /var/allen_atlas/25 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/annotation/ccf_2017/annotation_25.nrrd --no-check-certificate
RUN wget -O annotation.nrrd -P /var/allen_atlas/50 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/annotation/ccf_2017/annotation_50.nrrd --no-check-certificate
RUN wget -O annotation.nrrd -P /var/allen_atlas/100 https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/annotation/ccf_2017/annotation_100.nrrd --no-check-certificate

##########
# ANTsPy #
##########

# Install required python packages for ANTsPy, and antspy itself
# TODO: Might need to create a public requirements.txt file for this, if more packages are needed
RUN pip install requests
RUN pip install chart_studio
RUN pip install antspyx

###########
# Pytorch #
###########

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
