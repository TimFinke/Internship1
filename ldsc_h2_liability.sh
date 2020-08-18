# ldsc with SNP heritability on liability scale
./ldsc.py \
--h2 $1 \
--ref-ld-chr ./DIS/eur_w_ld_chr/ \
--w-ld-chr ./DIS/eur_w_ld_chr/ \
--samp-prev $2 \
--pop-prev $3 \
--out $4

