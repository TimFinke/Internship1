## path data
path_data <- "Data/genes_matrix_csv"
path_data_brain_age <- "Data/brain_age"
# libraries
library("SummarizedExperiment")
library("DESeq2")
library("tidyr")
library("psych")
## data
expression_matrix <- read.csv(file.path(path_data, "expression_matrix.csv"), header = FALSE)[,-c(1)] # column X1 was rownumber
expression_matrix2 <- expression_matrix %>%
  round() %>%
  as.matrix
columns_metadata <- read.csv(file.path(path_data, "columns_metadata.csv")) 
rows_metadata <- read.csv(file.path(path_data, "rows_metadata.csv"))

## descriptives of raw and rounded expression matrices for appendix
describe(expression_matrix)
describe(expression_matrix2)
## filtering for brain area and age group
# parameters
early_prenatal <- c("8 pcw", "9 pcw", "12 pcw")
mid_prenatal <- c("13 pcw", "15 pcw", "16 pcw", "17 pcw", "19 pcw", "21 pcw", "24 pcw")
late_prenatal <- c("25 pcw", "26 pcw", "35 pcw", "37 pcw", "38 pcw")
infancy <- c("4 mos", "10 mos", "1 yrs")
childhood <- c("2 yrs", "3 yrs", "4 yrs", "8 yrs", "11 yrs")
adolescence <- c("13 yrs", "15 yrs", "18 yrs", "19 yrs")
adulthood <- c("21 yrs", "23 yrs", "30 yrs", "36 yrs", "37 yrs", "40 yrs")

acronyms_hippocampus <- c("HIP")
acronyms_PFC <- c("DFC", "MFC", "VFC", "OFC")
# make dummy variables for agegroup and brain area
columns_metadata$agegroup_is_early_prenatal <- ifelse(columns_metadata$age %in% early_prenatal, 1, 0)
columns_metadata$agegroup_is_mid_prenatal <- ifelse(columns_metadata$age %in% mid_prenatal, 1, 0)
columns_metadata$agegroup_is_late_prenatal <- ifelse(columns_metadata$age %in% late_prenatal, 1, 0)
columns_metadata$agegroup_is_infancy <- ifelse(columns_metadata$age %in% infancy, 1, 0)
columns_metadata$agegroup_is_childhood <- ifelse(columns_metadata$age %in% childhood, 1, 0)
columns_metadata$agegroup_is_adolescence <- ifelse(columns_metadata$age %in% adolescence, 1, 0)
columns_metadata$agegroup_is_adulthood <- ifelse(columns_metadata$age %in% adulthood, 1, 0)

columns_metadata$structure_is_hippocampus <- ifelse(columns_metadata$structure_acronym %in% acronyms_hippocampus, 1, 0)
columns_metadata$structure_is_PFC <- ifelse(columns_metadata$structure_acronym %in% acronyms_PFC, 1, 0)

## read data into SE
dds <- SummarizedExperiment(assays = expression_matrix2,
                            rowData = rows_metadata,
                            colData = columns_metadata)
rownames(dds) <- rows_metadata$gene_symbol
# ddsSE for every subset, 1 per brain area per agegroup
ddsSE_HIP_early_pren <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_early_prenatal)
ddsSE_HIP_mid_pren <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_mid_prenatal)
ddsSE_HIP_late_pren <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_late_prenatal)
ddsSE_HIP_infan <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_infancy)
ddsSE_HIP_child <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_childhood)
ddsSE_HIP_adole <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_adolescence)
ddsSE_HIP_adult <- DESeqDataSet(dds, design = ~ structure_is_hippocampus + agegroup_is_adulthood)

ddsSE_PFC_early_pren <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_early_prenatal) 
ddsSE_PFC_mid_pren <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_mid_prenatal)
ddsSE_PFC_late_pren <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_late_prenatal)
ddsSE_PFC_infan <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_infancy)
ddsSE_PFC_child <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_childhood)
ddsSE_PFC_adole <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_adolescence)
ddsSE_PFC_adult <- DESeqDataSet(dds, design = ~ structure_is_PFC + agegroup_is_adulthood)
# age variabele maken, in design gooien. voor iedere leeftijd een p waarde, is het meer / minder dan de reference
# reference zijn alle andere variabelen.

"dds_function" <- function(ddsSE, name_inputfile, alpha = 5e-08){
  ddsSE <- DESeq(ddsSE)
  results_ddsSE <- results(ddsSE)
  resSig <- subset(results_ddsSE, padj < alpha)
  resSig$gene_name <- rownames(resSig)
  write.table(cbind.data.frame(resSig), 
              file = file.path(path_data_brain_age, name_inputfile), 
              row.names = FALSE)
}

# save results-file as .txt
dds_function(ddsSE_HIP_early_pren, "annot_input/results_ddsSE_HIP_early_pren.txt")
dds_function(ddsSE_HIP_mid_pren, "annot_input/results_ddsSE_HIP_mid_pren.txt")
dds_function(ddsSE_HIP_late_pren, "annot_input/results_ddsSE_HIP_late_pren.txt")
dds_function(ddsSE_HIP_infan, "annot_input/results_ddsSE_HIP_infan.txt")
dds_function(ddsSE_HIP_child, "annot_input/results_ddsSE_HIP_child.txt")
dds_function(ddsSE_HIP_adole, "annot_input/results_ddsSE_HIP_adole.txt")
dds_function(ddsSE_HIP_adult, "annot_input/results_ddsSE_HIP_adult.txt")

dds_function(ddsSE_PFC_early_pren, "annot_input/results_ddsSE_PFC_early_pren.txt")
dds_function(ddsSE_PFC_mid_pren, "annot_input/results_ddsSE_PFC_mid_pren.txt")
dds_function(ddsSE_PFC_late_pren, "annot_input/results_ddsSE_PFC_late_pren.txt")
dds_function(ddsSE_PFC_infan, "annot_input/results_ddsSE_PFC_infan.txt")
dds_function(ddsSE_PFC_child, "annot_input/results_ddsSE_PFC_child.txt")
dds_function(ddsSE_PFC_adole, "annot_input/results_ddsSE_PFC_adole.txt")
dds_function(ddsSE_PFC_adult, "annot_input/results_ddsSE_PFC_adult.txt")

### making annotations
source("make_LDSR_annot.R") # github.com/hillfung/make_LDSR_annot

table_gencode <- read.table(file.path(path_data_brain_age, "annotation_genes/gencode_v19_genes_only.tab"), header = TRUE)

table_HIP_early_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_early_pren.txt"), header = TRUE)
table_HIP_mid_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_mid_pren.txt"), header = TRUE)
table_HIP_late_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_late_pren.txt"), header = TRUE)
table_HIP_infan <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_infan.txt"), header = TRUE)
table_HIP_child <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_child.txt"), header = TRUE)
table_HIP_adole <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_adole.txt"), header = TRUE)
table_HIP_adult <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_HIP_adult.txt"), header = TRUE)

table_PFC_early_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_early_pren.txt"), header = TRUE)
table_PFC_mid_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_mid_pren.txt"), header = TRUE)
table_PFC_late_pren <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_late_pren.txt"), header = TRUE)
table_PFC_infan <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_infan.txt"), header = TRUE)
table_PFC_child <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_child.txt"), header = TRUE)
table_PFC_adole <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_adole.txt"), header = TRUE)
table_PFC_adult <- read.table(file.path(path_data_brain_age, "annot_input/results_ddsSE_PFC_adult.txt"), header = TRUE)

# making annotation files
"annotate_function" <- function(inputfile, annotname){
  make.LDSR.annot(input = inputfile,
                  out = file.path(path_data_brain_age, "annot_output/"),
                  annot.name = annotname,
                  input.type = "name", 
                  template.dir = "Data/brain_age/template/ASC1", 
                  add.windows = TRUE,
                  GeneCode = table_gencode)
  }

annotate_function(table_HIP_early_pren, "annotation_HIP_early_pren")
annotate_function(table_HIP_mid_pren, "annotation_HIP_mid_pren")
annotate_function(table_HIP_late_pren, "annotation_HIP_late_pren")
annotate_function(table_HIP_infan, "annotation_HIP_infan")
annotate_function(table_HIP_child, "annotation_HIP_child")
annotate_function(table_HIP_adole, "annotation_HIP_adole") 
annotate_function(table_HIP_adult, "annotation_HIP_adult")

annotate_function(table_PFC_early_pren, "annotation_PFC_early_pren")
annotate_function(table_PFC_mid_pren, "annotation_PFC_mid_pren")
annotate_function(table_PFC_late_pren, "annotation_PFC_late_pren")
annotate_function(table_PFC_infan, "annotation_PFC_infan")
annotate_function(table_PFC_child, "annotation_PFC_child")
annotate_function(table_PFC_adole, "annotation_PFC_adole")
annotate_function(table_PFC_adult, "annotation_PFC_adult")