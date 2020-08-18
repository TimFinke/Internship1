#$BATCH
# invoegen sbatch cores / taken
# invoegen hoeveel tijd runnen

# Required modules
module load 2019
module load Anaconda3
source activate ldsc3 

###### Script to reformat summary statistics data #######
# if not done already:
# wget https://data.broadinstitute.org/alkesgroup/LDSCORE/eur_w_chr.tar.bz2
# wget https://data.broadinstitute.org/aklesgroup/LDSCORE/w_hm3.snplist.bz2
# tar -jxvf eur_w_ld_chr.tar.bz2
# bunzip2 w_hm3.snplist.bz2

###### Munge Data ######
# unzip disorder data
# not needed for ADHD & ASD, already .txt files, hence the original names as input for munge
# also not needed: AN, manually written from .vcf.tsv to .txt in R before copying on lisa
# AN moet nog wel ff naar kijken, AN.txt heeft rownr als columngezet -> colnames schuiven op
# OOK moet AN nog ev aangepast worden bij munge_sumstats

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
gunzip -cvf ./DIS/HGHT/Meta-analysis_wood_et_al+UKBiobank_2018_top_3290_from_COJO_analysis.txt.gz > ./DIS/HGHT/HGHT.txt

# munge sumstats
./munge_sumstats.sh ./DIS/SCZ/SCZ.txt 79845 ./DIS_reformatted/SCZ
./munge_sumstats.sh ./DIS/ALZ/ALZ.txt 455258 ./DIS_reformatted/ALZ
./munge_sumstats.sh ./DIS/BIP/BIP_daner.txt 51710 ./DIS_reformatted/BIP
./munge_sumstats.sh ./DIS/INS/INS.txt 386533 ./DIS_reformatted/INS
./munge_sumstats.sh ./DIS/MDD/MDD.txt 461134 ./DIS_reformatted/MDD
./munge_sumstats.sh ./DIS/NEU/NEUdep.txt 357957 ./DIS_reformatted/NEUdep
./munge_sumstats.sh ./DIS/NEU/NEUwor.txt 348219 ./DIS_reformatted/NEUwor
./munge_sumstats.sh ./DIS/PTSD/PTSD.txt 206655 ./DIS_reformatted/PTSD
./munge_sumstats.sh ./DIS/SUD/SUDcan.txt 184765 ./DIS_reformatted/SUDcan
./munge_sumstats.sh ./DIS/AN/AN.txt 72517 ./DIS_reformatted/AN
./munge_sumstats.sh ./DIS/ASD/iPSYCH-PGC_ASD_Nov2017 46350 ./DIS_reformatted/ASD
./munge_sumstats.sh ./DIS/ADHD/adhd_eur_jun2017 52293 ./DIS_reformatted/ADHD

./munge_sumstats.sh ./DIS/HGHT/HGHT.txt 693529 ./DIS_reformatted/HGHT
