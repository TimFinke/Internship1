# munging ALL sumstats-files to DISORDER.sumstat.gz for further tests using ldsc and rg-matrix

# will work with pandas==0.18.1 and numpy==1.15.4

./munge_sumstats.py --sumstats ./DIS/ALZ/ALZ.txt --snp SNP --N 455258 --a1 A1 --a2 A2 --ignore uniqID.a1a2,CHR,BP,Nsum,Neff,dir,EAF,BETA,SE --out ./DIS_reformatted/ALZ --merge-alleles ./DIS/w_hm3.snplist
bash ./munge_sumstats.sh ./DIS/ADHD/adhd_eur_jun2017 52293 ./DIS_reformatted/ADHD
./munge_sumstats.py --sumstats ./DIS/AN/AN_new.txt --N 72517 --snp ID --a2 REF --a1 ALT --out ./DIS_reformatted/AN --merge-alleles ./DIS/w_hm3.snplist
bash ./munge_sumstats.sh ./DIS/ASD/iPSYCH-PGC_ASD_Nov2017 46350 ./DIS_reformatted/ASD
bash ./munge_sumstats.sh ./DIS/BIP/BIP_daner.txt 51710 ./DIS_reformatted/BIP
bash ./munge_sumstats.sh ./DIS/INS/INS.txt 386533 ./DIS_reformatted/INS
./munge_sumstats.py --sumstats ./DIS/MDD/MDD.txt --N 461134 --snp SNP --a1 A1 --a2 A2 --frq FRQ_A_59851 --N-cas-col Nca --N-con-col Nco --info INFO --ignore ngt,Direction,HetISqt,HetDf,HetPVa,Neff --out ./DIS_reformatted/MDD
./munge_sumstats.py --sumstats ./DIS/NEU/NEUdep.txt --N 357957 --snp RSID --N-col N --info INFO_UKB --ignore SNP,BETA,SE,CHR,POS,EAF --out ./DIS_reformatted/NEUdep --merge-alleles ./DIS/w_hm3.snplist
./munge_sumstats.py --sumstats ./DIS/NEU/NEUwor.txt --N 348219 --snp RSID --N-col N  --info INFO_UKB --ignore SNP,BETA,SE,CHR,POS,EAF --out ./DIS_reformatted/NEUwor --merge-alleles ./DIS/w_hm3.snplist
bash ./munge_sumstats.sh ./DIS/PTSD/PTSD.txt 206655 ./DIS_reformatted/PTSD
./munge_sumstats.py --sumstats ./DIS/SUD/SUDcan.txt --N 184765 --out ./DIS_reformatted/SUDcan --ignore Direction,HetISq,HetDf,HetPVa,Neff,Nca,BETA,SE --merge-alleles ./DIS/w_hm3.snplist
bash ./munge_sumstats.sh ./DIS/SCZ/SCZ.txt 79845 ./DIS_reformatted/SCZ
./munge_sumstats.py --sumstats ./DIS/HGHT/HGHT.txt --N 693529 --a1 Tested_Allele --a2 Other_Allele --out ./DIS_reformatted/HGHT --merge-alleles ./DIS/w_hm3.snplist

