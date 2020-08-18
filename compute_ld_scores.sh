#!/bin/sh
#SBATCH --job-name=ldscores_timfinke
#SBATCH --nodes=1
#SBATCH --time=14:59

# 1 = chromosome, 2 = prefix group


./ldsc.py \
--l2 \
--bfile ./CTS_analyses/1000G_plinkfiles/1000G.mac5eur.$1 \
--ld-wind-cm 1 \
--annot ./CTS_analyses/annot_output/$2.$1.annot.gz \
--out ./CTS_analyses/annot_output/$2.$1 \
--print-snps ./CTS_analyses/hapmap3_snps/hm.$1.snp
