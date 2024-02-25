FROM ubuntu:20.04

# Install basic utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends git wget unzip bzip2 sudo build-essential ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## Install Miniconda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    echo 'export PATH=$CONDA_DIR/bin:$PATH' > /etc/profile.d/conda.sh && \
    /bin/bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm -rf /tmp/*
    
    
WORKDIR /group5
COPY . /group5

RUN conda install -y mamba -c conda-forge

ADD ./environment.yml .
RUN mamba env update --file ./environment.yml && \
    conda clean -tipy

RUN conda init bash

RUN python3 -m pip install -r requirements.txt

EXPOSE 9090

# RUN python3 -m pip install -r requirements.txt
CMD ["bash", "launch.sh"]
