#!/usr/bin/env bash

# Pythonic setup. Creates virtual environment, installs pythonic packages.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2025

set -uexo pipefail

# Creating Virtual Environmen

rm -rf sea-venv
python3 -m venv sea-venv
source sea-venv/bin/activate

# Installing Python packages
python_packages=(wheel numpy scipy matplotlib scikit-learn networkx stochastic pygraphviz bs4 selenium statsmodels xlsxwriter pandas docx seaborn)
for pip_package in ${python_packages[@]}; do
    pip3 install $pip_package 
done

deactivate

set +uexo

