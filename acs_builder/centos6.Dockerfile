FROM centos:centos6

MAINTAINER CSRG <camilo.valenzuela@alumnos.usm.cl>

#Installing dependencies
RUN yum install -y epel-release

RUN yum groupinstall -y "Development Tools"

RUN yum install -y make automake bzip2 unzip patch libX11-devel \ 
    git wget gcc gcc-c++ emacs antlr expat-devel cppunit cppunit-devel \
    swig log4cpp castor xerces-c xerces-c-devel xerces-j2 ksh subversion \
    autoconf doxygen blas-devel byacc vim subversion openssh time bc flex \
    gsl-devel openldap-devel procmail python-pip python-devel openssl-devel \
    libxslt-devel libxml2-devel sqlite-devel freetype-devel libpng-devel bzip2-devel

#Installing Java JDK and ANT
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel  java-1.7.0-openjdk java-1.7.0-openjdk-devel ant

#Installing virtualenv
RUN pip install virtualenv

#Copying build script
COPY scripts/build.sh /build.sh
COPY scripts/build_acs.sh /build_acs.sh
COPY scripts/build_extprods.sh /build_extprods.sh
