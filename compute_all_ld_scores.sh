#!/bin/bash
#SBATCH --job-name=LDSC_timfinke
#SBATCH --nodes=1
#SBATCH --time=50:00
#SBATCH --mail-user=XXXXXX
#SBATCH --mail-type=END

bash ./compute_ld_scores.sh 1 $1
bash ./compute_ld_scores.sh 2 $1
bash ./compute_ld_scores.sh 3 $1
bash ./compute_ld_scores.sh 4 $1
bash ./compute_ld_scores.sh 5 $1
bash ./compute_ld_scores.sh 6 $1
bash ./compute_ld_scores.sh 7 $1
bash ./compute_ld_scores.sh 8 $1
bash ./compute_ld_scores.sh 9 $1
bash ./compute_ld_scores.sh 10 $1
bash ./compute_ld_scores.sh 11 $1
bash ./compute_ld_scores.sh 12 $1
bash ./compute_ld_scores.sh 13 $1
bash ./compute_ld_scores.sh 14 $1
bash ./compute_ld_scores.sh 15 $1
bash ./compute_ld_scores.sh 16 $1
bash ./compute_ld_scores.sh 17 $1
bash ./compute_ld_scores.sh 18 $1
bash ./compute_ld_scores.sh 19 $1
bash ./compute_ld_scores.sh 20 $1
bash ./compute_ld_scores.sh 21 $1
bash ./compute_ld_scores.sh 22 $1
