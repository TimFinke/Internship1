#!/bin/bash

#SBATCH --job-name=ldsc_rg_timfinke
#SBATCH --nodes=1
#SBATCH --time=4:59

# normal ldsc

# dependencies pandas==0.20,numpy==1.18.1
./ldsc.py \
--rg ./DIS_reformatted/ADHD.sumstats.gz,./DIS_reformatted/ALZ.sumstats.gz,./DIS_reformatted/AN.sumstats.gz,./DIS_reformatted/ASD.sumstats.gz,./DIS_reformatted/BIP.sumstats.gz,./DIS_reformatted/INS.sumstats.gz,./DIS_reformatted/MDD.sumstats.gz,./DIS_reformatted/NEUdep.sumstats.gz,./DIS_reformatted/NEUwor.sumstats.gz,./DIS_reformatted/PTSD.sumstats.gz,./DIS_reformatted/SCZ.sumstats.gz,./DIS_reformatted/SUDcan.sumstats.gz \
--ref-ld-chr ./DIS/eur_w_ld_chr/ \
--w-ld-chr ./DIS/eur_w_ld_chr/ \
--out ./Results_LDSC/ADHD_all

# ldsc with SNP heritability on liability scale
# same dependencies work out
#bash ldsc_h2_liability_all.sh

# rg matrix
bash ./make_rg_mat.sh \
-l ./ldsc.py \
-i ./DIS_reformatted/ \
-r ./DIS/eur_w_ld_chr/ \
-w ./DIS/eur_w_ld_chr/ \
-p 13 \
-c \
-n ./Results_LDSC/

# HGHT is nu verwijderd uit ldsc.py
