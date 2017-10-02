#!/bin/bash
cd /ACS

source LGPL/acsBUILD/config/.acs/.bash_profile.acs
# Delete the previous dir where ACS was installed.
rm -rf $ALMASW_INSTDIR
# Create the dir where ACS going to be installed.
mkdir -p $ALMASW_INSTDIR


#Compiling ExtProds
cd ExtProd/PRODUCTS
find . -name "config.cache" | xargs rm -rf

./download-products.sh
cd ../INSTALL
./buildTools
cd $ALMASW_INSTDIR
find -name "*.o" | xargs rm -rf

#Compiling ACS
cd /ACS
export MAKE_NOSTATIC=yes; export MAKE_NOIFR_CHECK=on
# Set the number of jobs and the charge
export MAKE_PARS=" -j 2 -l 2 "
# Paste the output logs from jenkins
make 2>&1 |tee build.summary

#chown -R jenkins:jenkins $ALMASW_INSTDIR
#chown -R jenkins:jenkins /ACS
