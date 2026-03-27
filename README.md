# Sea Cargo 

This repository contains the source code corresponding to the revenue management system 
implementation for our paper "A. Nekrashevich, M. Kovalyov, G. Levin, Y. Levin, G. Li, M. Nediak. 
Scalable Stochastic Model for Sea Cargo Revenue Management with Empty Container Transportation", 
currently available at SSRN https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6422798


## Repository contents

The repository is organized as a composition of multiple submodules. Here are the list of the
submodules together with their descriptions:

1. `data` -- submodule containing data-generating scripts
2. `presets` -- submodule containing instance configurations
3. `system` -- submodule containing the core system, implemented in C++
4. `process` -- submodule containing post-processing scripts, responsible for 
    building tables and visualizations
5. `launch` -- submodule containing launch-related scripts

Among the submodules described above, submodule `system` has two more submodules, located at
`system/src` and `system/lib/Sources-HSL`. Among those, `system/lib/Sources-HSL` contains 
private HSL libraries and therefore does not have public access. The content of the folder 
is the following: `coinhsl-2022.11.09.tar.gz`, `coinhsl-2022.11.09.zip`, 
`coinhsl-archive-2022.12.02.tar.gz`, and `coinhsl-archive-2022.12.02.zip`.

To get the corresponding libraries (free for academic purpose), one should visit 
`https://licences.stfc.ac.uk/product/coin-hsl`. Please send me a message (e.g. in LinkedIn) 
if you find some troubles integrating - I will try to help.

## Running the system

Implementation has been tested under Ubuntu 22.04, and is designed for launch under Ubuntu Linux.
The "one script to launch the entire system" is located in the root directory and 
called `run_system.sh`. The inner execution system is the following: first, datasets are 
sampled. Second, core C++ module is launched. Third, post-processing happens, which generates
images and tables.

The script `setup_system.sh` setups the necessary ubuntu packages. The script `setup_python.sh`
installs the necessary pythonic packages. The script `activate.sh` activates the corresponding
virtual environment. The script `document_system.sh` prepared the documentation (based on 
Doxygen for C++ part, and on Sphinx for Pythonic part).

## Remark

An important thing to mention is that costs are computed differently in the paper and in the 
implementation. While the paper assumes that complete transporation cost per container except 
hiring/off-hiring is computed in $c^R$ or $c^E$, this implementation assumes that the storage cost 
at cut-off should be counted separately. This cost has a form duration * amount * storage cost.

The allotment pricing structure in implementation also differs from the paper. Instead of working 
with price at booking and price at shipment, we consider allotment price $p$ and cancellation price 
$p_n$. The conversion is $p_b = p_n$ and $p_s = p - p_n$.

