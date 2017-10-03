#!/bin/bash
cd /ACS

# Clean the directory where the tools will be built.
git clean -d -f LGPL
# Source the bash profile needed to set environment variables to download and compile ACS
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
# Paste the output logs from jenkins
make 2>&1 |tee build.summary
