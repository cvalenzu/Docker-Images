#!/bin/bash
cd /ACS

source LGPL/acsBUILD/config/.acs/.bash_profile.acs
#Compiling ExtProds
cd ExtProd/PRODUCTS
./download-products.sh
cd ../INSTALL
./buildTools

#Compiling ACS
cd /ACS
export MAKE_NOSTATIC=yes; export MAKE_NOIFR_CHECK=on
make
