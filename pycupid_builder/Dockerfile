#Using pypi manylinux image
FROM quay.io/pypa/manylinux1_x86_64

#Installing dependencies
RUN yum groupinstall -y "Development Tools" && \
    yum install -y csh libXext-devel libXau-devel libX11-devel libXt-devel libxml2-devel ncurses-devel texlive-multirow python-devel Cython

#Download and install Anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.14-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN git clone https://github.com/ChileanVirtualObservatory/pycupid.git
