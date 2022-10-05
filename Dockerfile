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

##########
# ANTsPy #
##########

# Install required python packages for ANTsPy, and antspy itself
RUN pip install requests
RUN pip install chart_studio
RUN pip install antspyx

###########
# Pytorch #
###########

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
