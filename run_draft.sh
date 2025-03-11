#!/usr/bin/env bash

# Script to perform draft launches. Minimal amount of market sets, optimal compilation.

# Author: Aliaksandr Nekrashevich
# Email: aliaksandr.nekrashevich@queensu.ca
# (c) Smith School of Business, 2023
# (c) Smith School of Business, 2025

set -uexo pipefail

export job_max=6
export large_ram=0
export calibrate=0

export PYTHONHASHSEED=0

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`

experiment_root="${code_root}/experiment"
datasets_root="${experiment_root}/datasets"

source "$code_root"/activate.sh

presets_root="$code_root"/presets
"$presets_root"/fix_configurations.py

launch_root="$code_root"/launch
"$launch_root"/sample_datasets.sh
"$launch_root"/draft_ufgm.sh

process_root="$code_root"/process
"$process_root"/make_info_storage.sh
"$process_root"/create_images.sh
"$process_root"/visualize_inputs.sh

set +uexo
