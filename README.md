# PepViS
![image](image.svg)

PEPtide VIrtual Screening using PIPER and sblu. You can now run Cluspro Workflow locally. 



## To clone this repository:
```
git clone https://github.com/elvismartis/PepViS.git
```

## Requirements:
### 1. sblu: Python library and associated scripts for munging data files from ClusPro/FTMap/etc.. For more details visit [sblu - PyPI](https://pypi.org/project/sblu/).

You must install it as follows:

```
[sudo] pip install sblu
```
### 2. Piper: FFT-based docking software used in ClusPro. It is available as a 64 bit executable for use on Linux systems. Obtain PIPER from the webserver [Cluspro](https://cluspro.bu.edu/downloads.php). You need to register and Download the piper binary.
**PIPER is open-source for academic users ONLY**

## Usage
Run  run_multidocking.sh -> Runs Docking with PIPER and extract docked conformation as PDB file. 
```
sh run_multidocking.sh
```

