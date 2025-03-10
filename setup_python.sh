#!/usr/bin/env bash

# Pythonic setup. Creates virtual environment, installs pythonic packages.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2025

set -uexo pipefail

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`
cd "$code_root"


# Creating Virtual Environment

rm -rf sea-venv
python3 -m venv sea-venv
source sea-venv/bin/activate

# Installing Python packages
python_packages=(wheel numpy scipy matplotlib scikit-learn networkx stochastic 
	pygraphviz bs4 selenium statsmodels xlsxwriter pandas seaborn python-docx jinja2)
for pip_package in ${python_packages[@]}; do
    pip3 install $pip_package 
done

deactivate

set +uexo

