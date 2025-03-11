#!/usr/bin/env bash

# Script to perform debug launches.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2023
# (c) Smith School of Business, 2025


export job_max=6
export large_ram=0
export calibrate=0

export PYTHONHASHSEED=0

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`

experiment_root="${code_root}/experiment"
datasets_root="${experiment_root}/datasets"

cd "$code_root"
source "$code_root"/activate.sh

set -uexo pipefail

presets_root="$code_root"/presets
if [ ! -n "${APPTAINER_LAUNCH+1}" ]; then
    "$presets_root"/fix_configurations.py
fi

launch_root="$code_root"/launch
"$launch_root"/sample_debug.sh
"$launch_root"/debug_ufgm.sh

set +uexo
