############################### paths ##############################
path_data_raw <- "GWAS summary data/data raw"
path_data_scz <- "GWAS summary data/SCZ"
path_data_adhd <- "GWAS summary data/ADHD"
path_data_bip <- "GWAS summary data/BIP"
path_data_an <- "GWAS summary data/AN"
path_data_asd <- "GWAS summary data/ASD"
path_data_mdd <- "GWAS summary data/MDD"
path_data_ptsd <- "GWAS summary data/PTSD"
path_data_sud_can <- "GWAS summary data/SUD - cannabis"
path_data_ins <- "GWAS summary data/INS"
path_data_alz <- "GWAS summary data/ALZ"
path_data_smk <- "GWAS summary data/SMK"
path_data_neu <- "GWAS summary data/NEU"
path_data_hght <- "GWAS summary data//HGHT"

############################### data ###############################
# selecting the strongest GWA signal in 1,000,000 bp interval 
# ADHD
ADHD <- get_sig_SNP(file.path(path_data_adhd, "adhd_eur_jun2017/adhd_eur_jun2017"),  "P")
start <- Sys.time()
ADHD <- ADHD %>% # MAF .01 allready in sumstats
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 2.286422 secs
# 317 original, 11 end

# ALZ
ALZ <- get_sig_SNP(file.path(path_data_alz, "AD_sumstats_Jansenetal_2019sept.txt.gz"),  "P")
start <- Sys.time()
ALZ <- ALZ %>%
  filter(!((EAF < MAF_lower) | (EAF > MAF_upper))) %>%
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 1.404236 mins
# 2394 original, 25 end

# AN
AN <- get_sig_SNP(file.path(path_data_an, "pgcAN2.2019-07/pgcAN2.2019-07.vcf.tsv"), "PVAL", fill_true = FALSE)
start <- Sys.time() 
AN <- AN %>%
  arrange_function("PVAL", "POS") %>%
  LD_function("CHROM", "min_rank_pval", "POS", "ID", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 4.520598 secs
# 326 original, 10 end

# ASD
ASD <- get_sig_SNP(file.path(path_data_asd, "iPSYCH-PGC_ASD_Nov2017/iPSYCH-PGC_ASD_Nov2017"), "P")
start <- Sys.time()
ASD <- ASD %>% # MAF >= .01, INFO >= .7 allready in sumstats
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start 
# 93 original, 2 end

# BIP 
BIP <- get_sig_SNP(file.path(path_data_bip, "daner_PGC_BIP32b_mds7a_0416a.gz"), "P")
start <- Sys.time()
BIP <- BIP %>% # MAF already in sumstats
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 7.577543 secs
# 264 original, 18 end

# Insomnia
INS <- get_sig_SNP(file.path(path_data_ins, "Insomnia_sumstats_Jansenetal.txt.gz"), "P")
start <- Sys.time()
INS <- INS %>%
  filter(!((MAF < MAF_lower) | (MAF > MAF_upper))) %>%
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 14.67514 secs
# 463 original, 13 end

# Major Depression
MDD <- get_sig_SNP(file.path(path_data_mdd, "PGC_MDD2018_10kSNPs.gz"), "P") 
start <- Sys.time()
MDD <- MDD %>% # 45 SNPs
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 8.679323 secs


# complete dataset, whereas MDD only uses 10K SNPs, gives trouble later on with ldsc
MDD2 <- get_sig_SNP(file.path(path_data_mdd, "MDD2018_ex23andMe.gz"), "P") 
start <- Sys.time()
MDD2 <- MDD2 %>% # 11 SNPs
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of XXX secs

head(MDD2)



# neuroticism depressed subtype
NEU_dep <- get_sig_SNP(file.path(path_data_neu, "sumstats_depressed_affect_ctg_format.txt.gz"), "P")
start <- Sys.time()
NEU_dep <- NEU_dep %>% 
  filter(!((MAF < MAF_lower) | (MAF > MAF_upper))) %>%
  arrange_function("P", "POS") %>%
  LD_function("CHR", "min_rank_pval", "POS", "RSID", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 3.44723 mins
# start 5240 SNPs, end 68 SNPs

# neuroticism worry subtype
NEU_wor <- get_sig_SNP(file.path(path_data_neu, "sumstats_worry_ctg_format.txt.gz"), "P")
start <- Sys.time()
NEU_wor <- NEU_wor %>% 
  filter(!((MAF < MAF_lower) | (MAF > MAF_upper))) %>%
  arrange_function("P", "POS") %>%
  LD_function("CHR", "min_rank_pval", "POS", "RSID", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 4.167279 mins
# start 6382 SNPs, end 71 SNPs

# PTSD
PTSD <- get_sig_SNP(file.path(path_data_ptsd, "pts_eur_freeze2_overall.results.gz"), "P")
start <- Sys.time()
PTSD <- PTSD %>% 
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 0.07081199 secs
# 2 SNPs

# schizophrenia 
SCZ <- get_sig_SNP(file.path(path_data_scz, "ckqny.scz2snpres.gz"), "p")
start <- Sys.time()
SCZ <- SCZ %>%
  arrange_function("p", "bp") %>%
  LD_function("hg19chrc", "min_rank_pval", "bp", "snpid", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 17.14987 mins
# 94 SNPs

# SUD_can
SUD_can <- get_sig_SNP(file.path(path_data_sud_can, "Cannabis_ICC_23andmetop_UKB_het.txt.gz"), "P")
start <- Sys.time()
SUD_can <- na.omit(SUD_can) %>% # MAF  already in sumstats
  arrange_function("P", "BP") %>%
  LD_function("CHR", "min_rank_pval", "BP", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 2.018411 secs
# 752 original, 6 end

# CONTROL: height
HGHT <- get_sig_SNP(file.path(path_data_hght, "Meta-analysis_Wood_et_al+UKBiobank_2018_top_3290_from_COJO_analysis.txt.gz"), "P")
start <- Sys.time()
HGHT <- HGHT %>% # MAF  already in sumstats
  arrange_function("P", "POS") %>%
  LD_function("CHR", "min_rank_pval", "POS", "SNP", "BP_int_lower", "BP_int_higher")
Sys.time()-start # Time difference of 15.12421 mins
# 2483 original, 263 end