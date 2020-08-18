# unzip disorder data
# not needed for ADHD, AN, & ASD, already .txt files, hence the original names as input for munge

gunzip -cvf ./DIS/SCZ/ckqny.scz2snpres.gz > ./DIS/SCZ/SCZ.txt
gunzip -cvf ./DIS/ALZ/AD_sumstats_Jansenetal_2019sept.txt.gz > ./DIS/ALZ/ALZ.txt
gunzip -cvf ./DIS/BIP/daner_PGC_BIP2b_mds7a_0416a.gz > ./DIS/BIP/BIP_daner.txt
gunzip -cvf ./DIS/INS/Insomnia_sumstats_Jansenetal.txt.gz > ./DIS/INS/INS.txt
gunzip -cvf ./DIS/MDD/PGC_MDD2018_10kSNPs.gz > ./DIS/MDD/MDD.txt
gunzip -cvf ./DIS/NEU/sumstats_depressed_affect_ctg_format.txt.gz > ./DIS/NEU/NEUdep.txt
gunzip -cvf ./DIS/NEU/sumstats_worry_ctg_format.txt.gz > ./DIS/NEU/NEUwor.txt
gunzip -cvf ./DIS/PTSD/pts_eur_freeze2_overall.results.gz > ./DIS/PTSD/PTSD.txt
gunzip -cvf ./DIS/SUD/Cannabis_ICC_23andmetop_UKB_het.txt.gz > ./DIS/SUD/SUDcan.txt
# height
gunzip -cvf ./DIS/HGHT/Meta-analysis_Wood_et_al+UKBiobank_2018.txt.gz > ./DIS/HGHT/HGHT.txt

