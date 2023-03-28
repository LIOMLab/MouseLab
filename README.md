# LIOM Registration and Segmentation Environment

This repository holds the Dockerfile responsible for building the docker image which holds the tools for the
registration and segmentation of mouse brain data.

## Included libraries

- Ubuntu 22.04
- CUDA 11.7
- CuDNN 8
- Python 3.10
- ANTsPyx
- PyTorch 1.12

## Usage

Replace the `</local/directory>` below with the path to the directory where you store data which you want to use within
docker. These files will be available in the `/root/` or `~` directory within the docker image.

```docker pull liomlab/mouselab:latest```

```docker run --name mouselab -v </local/directory>:/root/ liomlab/mouselab```

## Compatibility

Images are build for Linux/AMD64.
