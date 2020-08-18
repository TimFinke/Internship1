#!/bin/bash
#SBATCH --job-name=LDSC_timfinke
#SBATCH --nodes=1
#SBATCH --time=50:00
#SBATCH --mail-user=XXXXX
#SBATCH --mail-type=END

bash CTS_ind_cell.sh $1.sumstats.gz ASC1. $1/$1_ASC1
bash CTS_ind_cell.sh $1.sumstats.gz ASC2. $1/$1_ASC2
bash CTS_ind_cell.sh $1.sumstats.gz END. $1/$1_END
bash CTS_ind_cell.sh $1.sumstats.gz exCA1. $1/$1_exCA1
bash CTS_ind_cell.sh $1.sumstats.gz exCA3. $1/$1_exCA3
bash CTS_ind_cell.sh $1.sumstats.gz exDG. $1/$1_exDG
bash CTS_ind_cell.sh $1.sumstats.gz exPFC1. $1/$1_exPFC1
bash CTS_ind_cell.sh $1.sumstats.gz exPFC2. $1/$1_exPFC2
bash CTS_ind_cell.sh $1.sumstats.gz GABA1. $1/$1_GABA1
bash CTS_ind_cell.sh $1.sumstats.gz GABA2. $1/$1_GABA2
bash CTS_ind_cell.sh $1.sumstats.gz MG. $1/$1_MG
bash CTS_ind_cell.sh $1.sumstats.gz NSC. $1/$1_NSC
bash CTS_ind_cell.sh $1.sumstats.gz ODC1. $1/$1_ODC1
bash CTS_ind_cell.sh $1.sumstats.gz OPC. $1/$1_OPC
bash CTS_ind_cell.sh $1.sumstats.gz Unclassified. $1/$1_Unclassified

# ASC1, ASC2, END, exCA1, exCA3, exDG, exPFC1, exPFC2, GABA1, GABA2, MG, NSC, ODC1, OPC, Unclassified
bash CTS_all_sig_cells.sh $1.sumstats.gz ./CTS_analyses/LDscores/ASC1.,./CTS_analyses/LDscores/ASC2.,./CTS_analyses/LDscores/END.,./CTS_analyses/LDscores/exCA1.,./CTS_analyses/LDscores/exCA3.,./CTS_analyses/LDscores/exDG.,./CTS_analyses/LDscores/exPFC1.,./CTS_analyses/LDscores/exPFC2.,./CTS_analyses/LDscores/GABA1.,./CTS_analyses/LDscores/GABA2.,./CTS_analyses/LDscores/MG.,./CTS_analyses/LDscores/NSC.,./CTS_analyses/LDscores/ODC1.,./CTS_analyses/LDscores/OPC.,./CTS_analyses/LDscores/Unclassified. $1/$1_full_model







# only for ADHD:

#bash CTS_ind_cell.sh ADHD.sumstats.gz ASC1. ADHD/ADHD_ASC1
#bash CTS_ind_cell.sh ADHD.sumstats.gz ASC2. ADHD/ADHD_ASC2
#bash CTS_ind_cell.sh ADHD.sumstats.gz END. ADHD/ADHD_END
#bash CTS_ind_cell.sh ADHD.sumstats.gz exCA1. ADHD/ADHD_exCA1
#bash CTS_ind_cell.sh ADHD.sumstats.gz exCA3. ADHD/ADHD_exCA3
#bash CTS_ind_cell.sh ADHD.sumstats.gz exDG. ADHD/ADHD_exDG
#bash CTS_ind_cell.sh ADHD.sumstats.gz exPFC1. ADHD/ADHD_exPFC1
#bash CTS_ind_cell.sh ADHD.sumstats.gz exPFC2. ADHD/ADHD_exPFC2
#bash CTS_ind_cell.sh ADHD.sumstats.gz GABA1. ADHD/ADHD_GABA1
#bash CTS_ind_cell.sh ADHD.sumstats.gz GABA2. ADHD/ADHD_GABA2
#bash CTS_ind_cell.sh ADHD.sumstats.gz MG. ADHD/ADHD_MG
#bash CTS_ind_cell.sh ADHD.sumstats.gz NSC. ADHD/ADHD_NSC
#bash CTS_ind_cell.sh ADHD.sumstats.gz ODC1. ADHD/ADHD_ODC1
#bash CTS_ind_cell.sh ADHD.sumstats.gz OPC. ADHD/ADHD_OPC
#bash CTS_ind_cell.sh ADHD.sumstats.gz Unclassified. ADHD/ADHD_Unclassified

# ASC1, ASC2, exCA1, END, exCA3, exDG, exPFC1, exPFC2, GABA1, GABA2, MG, NSC, ODC1, OPC, Unclassified
#bash CTS_all_sig_cells.sh ADHD.sumstats.gz ./CTS_analyses/LDscores/ASC1.,./CTS_analyses/LDscores/ASC2.,./CTS_analyses/LDscores/END.,./CTS_analyses/LDscores/exCA1.,./CTS_analyses/LDscores/exCA3.,./CTS_analyses/LDscores/exDG.,./CTS_analyses/LDscores/exPFC1.,./CTS_analyses/LDscores/exPFC2.,./CTS_analyses/LDscores/GABA1.,./CTS_analyses/LDscores/GABA2.,./CTS_analyses/LDscores/MG.,./CTS_analyses/LDscores/NSC.,./CTS_analyses/LDscores/ODC1.,./CTS_analyses/LDscores/OPC.,./CTS_analyses/LDscores/Unclassified. ADHD/ADHD_full_model

# full model shows ASC1, ASC2, MG, NSC, ODC1 not significant for p < .05

# alles erin
# print coefficient
# column p waarde in univariate analyse, aan elkaar plakken alle individuele tests
# in R script plaatje plakken











