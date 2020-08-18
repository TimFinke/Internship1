
bash ./ldsc.py \
--h2 ./DIS_reformatted/ADHD.sumstats.gz,./DIS_reformatted/ALZ.sumstats.gz,./DIS_reformatted/AN.sumstats.gz,./DIS_reformatted/ASD.sumstats.gz,./DIS_reformatted/BIP.sumstats.gz,./DIS_reformatted/INS.sumstats.gz,./DIS_reformatted/MDD.sumstats.gz,./DIS_reformatted/NEUdep.sumstats.gz,./DIS_reformatted/NEUwor.sumstats.gz,./DIS_reformatted/PTSD.sumstats.gz,./DIS_reformatted/SCZ.sumstats.gz,./DIS_reformatted/SUDcan.sumstats.gz \
--ref-ld-chr ./DIS/eur_w_ld_chr/ \
--w-ld-chr ./DIS/eur_w_ld_chr/ \
--samp-prev $2 \
--pop-prev $3 \
--out ./Results_LDSC/Liab_h2/liability_scale_heritability \
