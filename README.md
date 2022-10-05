# LIOM Registration and Segmentation Enviornment

This repository holds the Dockerfile responsible for building the docker image which holds the tools for the
registration and segmentation of brain data.

## Included libraries

- Ubuntu 22.04
- CUDA 11.7
- CuDNN 8
- Python 3.10
- ANTsPyx
- PyTorch 1.12

## Usage

Replace the </local/directory> below with the path to the directory where you store data which you want to use within
docker. These files will be available in the /root/ or ~ directory within the docker image.

```docker pull liomlab/pythonlab:latest```

```docker run --name pythonlab -v </local/directory>:/root/ liomlab/pythonlab```

## Compatibility

Images are build for Linux/AMD64.
