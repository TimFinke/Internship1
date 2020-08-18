

bash ./make_annot.py \
--gene-set-file ./CTS_analyses/annot_output/geneset_HIP_adole.txt \
--gene-coord-file ./CTS_analyses/annot_output/annotation_HIP_adole.included \
--windowsize 500000 \
--bimfile ./CTS_analyses/1000G_EUR_Phase3_plink/1000G.EUR.QC.$1.bim \
--annot-file ./CTS_analyses/LDscores_agegroups/HIP_adole.annot.gz