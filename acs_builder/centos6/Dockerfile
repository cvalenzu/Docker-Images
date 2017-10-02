FROM centos:centos6

MAINTAINER CSRG <camilo.valenzuela@alumnos.usm.cl>

#Installing dependencies
RUN yum install -y epel-release

RUN yum install -y make bzip2 unzip patch libX11-devel \ 
    git wget gcc gcc-c++ emacs antlr expat-devel cppunit cppunit-devel \
    swig log4cpp castor xerces-c xerces-c-devel xerces-j2 ksh subversion \
    autoconf doxygen blas-devel byacc vim subversion openssh time bc flex \
    gsl-devel openldap-devel procmail python-pip python-devel openssl-devel \
    libxslt-devel libxml2-devel sqlite-devel freetype-devel libpng-devel bzip2-devel

#Installing Java JDK
COPY download_jdk.sh root/download_jdk.sh
RUN ./root/download_jdk.sh -v 8

RUN pip install virtualenv
