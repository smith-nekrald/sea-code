#!/usr/bin/env bash

# Script to set up C++ and python

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2023
# (c) Smith School of Business, 2025

set -uexo pipefail

export online=1

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`

system_root="$code_root"/system
"$system_root"/setup_cpp.sh
"$code_root"/setup_python.sh

set +uexo
