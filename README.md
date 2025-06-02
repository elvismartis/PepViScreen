# PepViScreen
 ![image](image.svg)

PEPtide VIrtual Screening using PIPER and sblu. You can now run Cluspro Workflow locally. 



## To clone this repository:
```
git clone https://github.com/elvismartis/PepViScreen.git
```
## Steps for installation and setup
```
python3 -m  venv </path>/piper
source </path>/piper/bin/activate
python3 -m pip install -r requirements.txt 
```

## Requirements:

1. **sblu**: Python library and associated scripts for munging data files from ClusPro/FTMap/etc.. For more details, visit [sblu - PyPI](https://pypi.org/project/sblu/).

 2. **Piper**: FFT-based docking software used in ClusPro. It is available as a 64-bit executable for use on Linux systems. Obtain PIPER from the web server [Cluspro](https://cluspro.bu.edu/downloads.php). You need to register and download the Piper binary.
**PIPER is open-source for academic users ONLY**

3. **prepare_for_piper.py**: This python script prepares the PDB file compatible with PIPER. This script is modification of the prepare.py that is bundled with piper_package. The original bundled python script and the dependencies on pdb2pqr-1.9.0 work only on python2.7. prepare_for_piper.py is a workaround for using latest pdq2pqr and python3. 

## Usage
To perform **protein-protein** or **protein-peptide** docking with PIPER and extract docked conformation as a PDB file. 
```
sh run_multidocking.sh
```

 To prepare the receptor protein, execute the following command before running "run_multidocking.sh". This needs to be done once for each Receptor structure. The output will be "**XYZ_pnon.pdb**". Place this file in a directory; the PATH to this directory needs to be added in the main BASH script at "REC="

 ```
 $PIPER_HOME/prepare_for_piper.py XYZ.pdb
```
## Known Issues 