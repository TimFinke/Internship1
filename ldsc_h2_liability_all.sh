# run for every disorder seperately

# works with pandas==0.20 and numpy==1.18.1


bash ./ldsc_h2_liability.sh ./DIS_reformatted/ADHD.sumstats.gz 0.3583773 .05 ./Results_LDSC/Liability/ADHD
bash ./ldsc_h2_liability.sh ./DIS_reformatted/ALZ.sumstats.gz 0.1578885 .003368 ./Results_LDSC/Liability/ALZ
bash ./ldsc_h2_liability.sh ./DIS_reformatted/AN.sumstats.gz 0.2343175 .01 ./Results_LDSC/Liability/AN
bash ./ldsc_h2_liability.sh ./DIS_reformatted/ASD.sumstats.gz 0.3965696 .01 ./Results_LDSC/Liability/ASD
bash ./ldsc_h2_liability.sh ./DIS_reformatted/BIP.sumstats.gz 0.3935796 .01 ./Results_LDSC/Liability/BIP
bash ./ldsc_h2_liability.sh ./DIS_reformatted/INS.sumstats.gz 0.2830004 .1 ./Results_LDSC/Liability/INS
bash ./ldsc_h2_liability.sh ./DIS_reformatted/MDD.sumstats.gz 0.2833536 .15 ./Results_LDSC/Liability/MDD
bash ./ldsc_h2_liability.sh ./DIS_reformatted/PTSD.sumstats.gz 0.1569185 .078 ./Results_LDSC/Liability/PTSD
bash ./ldsc_h2_liability.sh ./DIS_reformatted/SCZ.sumstats.gz 0.4288434 .01 ./Results_LDSC/Liability/SCZ
bash ./ldsc_h2_liability.sh ./DIS_reformatted/SUDcan.sumstats.gz 0.2878197 .45 ./Results_LDSC/Liability/SUDcan


