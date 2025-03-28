#!/bin/bash

## Defining the piper PATH and PATH for parameters
PIPER_HOME=<PATH_TO_PIPER_PACKAAGE>
ATOMS=$PIPER_HOME/prms/atoms.prm
COEFFS=$PIPER_HOME/prms/coeffs.prm
ROTS=$PIPER_HOME/prms/rots.prm


# Define RECEPTOR for DOCKING
REC="<PATH_TO_RECEPTOR>/XYZ_pnon.pdb"
# To prepare the receptor protein run the following command before running this Script
# $PIPER_HOME/protein_prep/prepare.py XYZ.pdb

## Defining PATH for unprepared Ligand proteins
LIGPATH="<PATH_TO_PEPTIDES>"


# Initiating Loop for docking multiple ligand peptides
for LIG in $LIGPATH/*.pdb
do
	b=`basename $LIG .pdb`
	echo "Preparing and Docking $b"
	mkdir $b
	cd $b 
	cp $LIG ./
	$PIPER_HOME/protein_prep/prepare.py ${b}.pdb
	$PIPER_HOME/piper -vv -c1.0 -k4 --msur_k=1.0 --maskr=1.0 -T FFTW_EXHAUSTIVE --surface-potential --enative -t 1 -p $ATOMS -f $COEFFS -r $ROTS $REC ${b}_pnon.pdb
	
	# Starting the Inner loop to extract bound coordinates from RAW LIGAND CONFORMATION using piper Rotation MATRIX
	
	for j in ft.*
	do
       	    t=`basename "${j#ft.}"`
            echo "Running $t"
            
            # Create pairwise RMSD matrices
            sblu measure pwrmsd -n 1000 --only-backbone  --only-interface --rec $REC -o clustermat.${t} ${b}_pnon.pdb $j $ROTS
            
            # Run clustering on the matrix
            sblu docking cluster -o clustermat.${t}.clusters clustermat.${t}
            
            # Generate cluster centers without minimising models
            sblu docking gen_cluster_pdb -l 1 clustermat.${t}.clusters $j $ROTS ${b}_pnon.pdb -o lig_${t}
        done
	cd ../
done
exit
	
