#!/bin/bash
cd /ACS

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
sed -i '210s/.*/\techo "Skipping Ant"/' buildTools

./buildTools  2>&1 |tee build.summary

git chechout buildTools
cd $ALMASW_INSTDIR
find -name "*.o" | xargs rm -rf
