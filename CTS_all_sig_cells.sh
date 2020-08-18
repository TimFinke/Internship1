./ldsc.py \
--h2 ./DIS_reformatted/$1 \
--ref-ld-chr ./CTS_analyses/baseline-1/baseline.,$2 \
--w-ld-chr ./CTS_analyses/weights_hm3_no_hla/weights. \
--overlap-annot \
--print-coefficients \
--frqfile-chr ./CTS_analyses/1000G_Phase3_frq/1000G.EUR.QC. \
--out ./CTS_analyses/Results/$3
