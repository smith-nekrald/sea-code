#!/usr/bin/env bash

# Script for generating documentation in all submodules.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2023

set -uexo pipefail

rm -rf docs
mkdir -p docs

# Documenting data generation part.
cd data
./document.sh
cd docs/build
zip -r sea-cargo-data-html.zip html
mv sea-cargo-data-html.zip ../../../docs/sea-cargo-data-html.zip
mv latex/*.pdf ../../../docs/sea-cargo-data-latex.pdf
cd ../../../

# Documenting launch part.
cd launch 
./document.sh
cd docs/build
zip -r sea-cargo-launch-html.zip html
mv sea-cargo-launch-html.zip ../../../docs/sea-cargo-launch-html.zip
mv latex/*.pdf ../../../docs/sea-cargo-launch-latex.pdf
cd ../../../

# Documenting processing part.
cd process 
./document.sh
cd docs/build
zip -r sea-cargo-process-html.zip html
mv sea-cargo-process-html.zip ../../../docs/sea-cargo-process-html.zip
mv latex/*.pdf ../../../docs/sea-cargo-process-latex.pdf
cd ../../../

# Documenting C++ part.
cd system
rm -rf docs
doxygen
cd docs/latex
make
cp refman.pdf ../../../docs/sea-cargo-cpp-latex.pdf
cd ..
zip -r sea-cargo-cpp-html.zip html
mv sea-cargo-cpp-html.zip ../../docs/sea-cargo-cpp-html.zip   
cd ../..

set +uexo

