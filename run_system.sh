#!/usr/bin/env bash

# A one script to launch the entire system.

set -uexo pipefail

script_path=`readlink -f "${BASH_SOURCE[0]}"`
script_dir=`dirname "$script_path"`
code_root=`readlink -f "$script_dir"`

system_root="$code_root"/system
"$system_root"/setup.sh

presets_root="$code_root"/presets
"$presets_root"/fix_configurations.py

launch_root="$code_root"/launch
"$launch_root"/sample_datasets.sh
"$launch_root"/ufgm_with_split.sh

process_root="$code_root"/process
"$process_root"/make_info_storage.sh
"$process_root"/create_images.sh
"$process_root"/visualize_inputs.sh

set +uexo
