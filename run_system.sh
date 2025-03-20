#!/usr/bin/env bash

# A one script to launch the entire system.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2023
# (c) Smith School of Business, 2025

export job_max=8
export large_ram=0
export calibrate=0

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`

experiment_root="${code_root}/experiment"
datasets_root="${experiment_root}/datasets"

cd "$code_root"
export PYTHONHASHSEED=0
source "$code_root"/activate.sh

set -uexo pipefail

presets_root="$code_root"/presets
if [ ! -n "${APPTAINER_LAUNCH+1}" ]; then
    "$presets_root"/fix_configurations.py
fi

launch_root="$code_root"/launch
"$launch_root"/sample_datasets.sh
"$launch_root"/ufgm_with_split.sh

process_root="$code_root"/process
"$process_root"/make_info_storage.sh
"$process_root"/create_images.sh
"$process_root"/visualize_inputs.sh

set +uexo
