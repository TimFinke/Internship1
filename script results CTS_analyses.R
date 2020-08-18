options(knitr.duplicate.label = "allow")

############################### paths ##############################
path_data_models <- "Data/CTS_analyses/Models"
path_data_models_age <- "Data/CTS_analyses/agegroups/Models"

############################### data ###############################
###################### models celtype ##############################
# univariate model
ADHD_uni_model <- make_univariate_model("ADHD_univariate_model.txt")
ALZ_uni_model <- make_univariate_model("ALZ_univariate_model.txt")
AN_uni_model <- make_univariate_model("AN_univariate_model.txt")
ASD_uni_model <- make_univariate_model("ASD_univariate_model.txt")
BIP_uni_model <- make_univariate_model("BIP_univariate_model.txt")
HGHT_uni_model <- make_univariate_model("HGHT_univariate_model.txt")
INS_uni_model <- make_univariate_model("INS_univariate_model.txt")
MDD_uni_model <- make_univariate_model("MDD_univariate_model.txt")
NEUdep_uni_model <- make_univariate_model("NEUdep_univariate_model.txt")
NEUwor_uni_model <- make_univariate_model("NEUwor_univariate_model.txt")
PTSD_uni_model <- make_univariate_model("PTSD_univariate_model.txt")
SCZ_uni_model <- make_univariate_model("SCZ_univariate_model.txt")
SUDcan_uni_model <- make_univariate_model("SUDcan_univariate_model.txt")

input_ct_uni <- rbind(ADHD_uni_model, ALZ_uni_model, AN_uni_model, ASD_uni_model,
                      BIP_uni_model, HGHT_uni_model, INS_uni_model, MDD_uni_model,
                      NEUdep_uni_model, NEUwor_uni_model, PTSD_uni_model, SCZ_uni_model,
                      SUDcan_uni_model)
rm(ADHD_uni_model, ALZ_uni_model, AN_uni_model, ASD_uni_model,
   BIP_uni_model, HGHT_uni_model, INS_uni_model, MDD_uni_model,
   NEUdep_uni_model, NEUwor_uni_model, PTSD_uni_model, SCZ_uni_model,
   SUDcan_uni_model)

# full model coefficient p value
ADHD_full_model <- make_full_model("ADHD_full_model.results", "CNS", "ADHD")
ALZ_full_model <- make_full_model("ALZ_full_model.results", "CNS", "ALZ")
AN_full_model <- make_full_model("AN_full_model.results", "CNS", "AN")
ASD_full_model <- make_full_model("ASD_full_model.results", "CNS", "ASD")
BIP_full_model <- make_full_model("BIP_full_model.results", "CNS", "BIP")
HGHT_full_model <- make_full_model("HGHT_full_model.results", "CNS", "HGHT")
INS_full_model <- make_full_model("INS_full_model.results", "CNS", "INS")
MDD_full_model <- make_full_model("MDD_full_model.results", "CNS", "MDD")
NEUdep_full_model <- make_full_model("NEUdep_full_model.results", "CNS", "NEUdep")
NEUwor_full_model <- make_full_model("NEUwor_full_model.results", "CNS", "NEUwor")
PTSD_full_model <- make_full_model("PTSD_full_model.results", "CNS", "PTSD")
SCZ_full_model <- make_full_model("SCZ_full_model.results", "CNS", "SCZ")
SUDcan_full_model <- make_full_model("SUDcan_full_model.results", "CNS", "CAN")

input_ct <- rbind(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
                  BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
                  NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
                  SUDcan_full_model)
rm(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
      BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
      NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
      SUDcan_full_model)

# full model enrichment
ADHD_full_model <- make_full_model_enrichment("ADHD_full_model.results", "CNS", "ADHD")
ALZ_full_model <- make_full_model_enrichment("ALZ_full_model.results", "CNS", "ALZ")
AN_full_model <- make_full_model_enrichment("AN_full_model.results", "CNS", "AN")
ASD_full_model <- make_full_model_enrichment("ASD_full_model.results", "CNS", "ASD")
BIP_full_model <- make_full_model_enrichment("BIP_full_model.results", "CNS", "BIP")
HGHT_full_model <- make_full_model_enrichment("HGHT_full_model.results", "CNS", "HGHT")
INS_full_model <- make_full_model_enrichment("INS_full_model.results", "CNS", "INS")
MDD_full_model <- make_full_model_enrichment("MDD_full_model.results", "CNS", "MDD")
NEUdep_full_model <- make_full_model_enrichment("NEUdep_full_model.results", "CNS", "NEUdep")
NEUwor_full_model <- make_full_model_enrichment("NEUwor_full_model.results", "CNS", "NEUwor")
PTSD_full_model <- make_full_model_enrichment("PTSD_full_model.results", "CNS", "PTSD")
SCZ_full_model <- make_full_model_enrichment("SCZ_full_model.results", "CNS", "SCZ")
SUDcan_full_model <- make_full_model_enrichment("SUDcan_full_model.results", "CNS", "CAN")

input_ct_enrichment <- rbind(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
                  BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
                  NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
                  SUDcan_full_model)
rm(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
   BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
   NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
   SUDcan_full_model)

###################### models age ##############################
# full model coefficient p value
ADHD_full_model <- make_full_model_agegroups("ADHD_full_model.results", "ADHD")
ALZ_full_model <- make_full_model_agegroups("ALZ_full_model.results", "ALZ")
AN_full_model <- make_full_model_agegroups("AN_full_model.results", "AN")
ASD_full_model <- make_full_model_agegroups("ASD_full_model.results", "ASD")
BIP_full_model <- make_full_model_agegroups("BIP_full_model.results", "BIP")
HGHT_full_model <- make_full_model_agegroups("HGHT_full_model.results", "HGHT")
INS_full_model <- make_full_model_agegroups("INS_full_model.results", "INS")
MDD_full_model <- make_full_model_agegroups("MDD_full_model.results", "MDD")
NEUdep_full_model <- make_full_model_agegroups("NEUdep_full_model.results", "NEUdep")
NEUwor_full_model <- make_full_model_agegroups("NEUwor_full_model.results", "NEUwor")
PTSD_full_model <- make_full_model_agegroups("PTSD_full_model.results", "PTSD")
SCZ_full_model <- make_full_model_agegroups("SCZ_full_model.results", "SCZ")
SUDcan_full_model <- make_full_model_agegroups("SUDcan_full_model.results", "CAN")

input_age <- rbind(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
                  BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
                  NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
                  SUDcan_full_model)
rm(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
   BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
   NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
   SUDcan_full_model)

# full model enrichment p value
ADHD_full_model <- make_full_model_enrichment_agegroups("ADHD_full_model.results", "ADHD")
ALZ_full_model <- make_full_model_enrichment_agegroups("ALZ_full_model.results", "ALZ")
AN_full_model <- make_full_model_enrichment_agegroups("AN_full_model.results", "AN")
ASD_full_model <- make_full_model_enrichment_agegroups("ASD_full_model.results", "ASD")
BIP_full_model <- make_full_model_enrichment_agegroups("BIP_full_model.results", "BIP")
HGHT_full_model <- make_full_model_enrichment_agegroups("HGHT_full_model.results", "HGHT")
INS_full_model <- make_full_model_enrichment_agegroups("INS_full_model.results", "INS")
MDD_full_model <- make_full_model_enrichment_agegroups("MDD_full_model.results", "MDD")
NEUdep_full_model <- make_full_model_enrichment_agegroups("NEUdep_full_model.results", "NEUdep")
NEUwor_full_model <- make_full_model_enrichment_agegroups("NEUwor_full_model.results", "NEUwor")
PTSD_full_model <- make_full_model_enrichment_agegroups("PTSD_full_model.results", "PTSD")
SCZ_full_model <- make_full_model_enrichment_agegroups("SCZ_full_model.results", "SCZ")
SUDcan_full_model <- make_full_model_enrichment_agegroups("SUDcan_full_model.results", "CAN")

input_age_enrichment <- rbind(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
                             BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
                             NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
                             SUDcan_full_model)
rm(ADHD_full_model, ALZ_full_model, AN_full_model, ASD_full_model,
   BIP_full_model, HGHT_full_model, INS_full_model, MDD_full_model,
   NEUdep_full_model, NEUwor_full_model, PTSD_full_model, SCZ_full_model,
   SUDcan_full_model)

####################### trait lists  ###############################
set.seed(444)
col <- rainbow(1000)
col2 <- sample(col, 13)
# cell type
trait_list_ct <- tibble(
  category = c("CNS"),
  trait = c("ADHD", "ALZ", "AN", "ASD",
            "BIP", "HGHT", "INS", "MDD",
            "NEUdep", "NEUwor", "PTSD", "SCZ",
            "CAN"),
  color = sample(col2, 13)
  )
# age groups
trait_list_age <- tibble(
  category = c(rep("Hippocampus", times = 13), rep("Prefrontal Cortex", times = 13)),
  trait = rep(c("ADHD", "ALZ", "AN", "ASD",
            "BIP", "HGHT", "INS", "MDD",
            "NEUdep", "NEUwor", "PTSD", "SCZ",
            "CAN"), times = 2),
  color = rep(col2, times = 2) 
)
################### names for CT and AGE ################
ct_names <- tibble(
  category = c("CNS"),
  cell_type = c("Astrocyte 1", "Astrocyte 2", "Endothelial Cell", "Pyramidal Hippocampal CA 1", "Pyramidal Hippocampal CA 3",
                "Granule Neuron Hippocampal Dentate Gyrus Region", "Glutamatergic Neuron PFC 1", "Glutamatergic Neuron PFC 2", ", GABAergic interneuron 1", ", GABAergic interneuron 2",
                "Microglia", "Neural Stem Cell", "Oligodendrocyte 1", "Oligodendrocyte Precursor Cell", "Unclassified"),
  cell_type_clean = c("ASC1", "ASC2", "END", "exCA1", "exCA3",
                      "exDG", "exPFC1", "exPFC2", "GABA1", "GABA2",
                      "MG", "NSC", "ODC1", "OPC", "Unclassified")
  )
age_names <- tibble(
  category = c(rep("Hippocampus", times = 7), rep("Prefrontal Cortex", times = 7)),
  cell_type = rep(c("Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                "Childhood", "Adolescence", "Adulthood"), times = 2),
  cell_type_clean = rep(c("Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                          "Childhood", "Adolescence", "Adulthood"), times = 2)
  )
