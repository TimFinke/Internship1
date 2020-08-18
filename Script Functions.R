# Script functions Scriptie
options(knitr.duplicate.label = "allow")

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

path_data_rg_matrix <- "Data/Resultaten LDSC Matrix Compleet"

############################### parameters #########################
MAF_lower <- .01
MAF_upper <- 1 - MAF_lower

############################### functions ##########################
## table 1
"get_sig_SNP" <- function(filepath, namepvariable, fill_true = TRUE){
  GWAS <- fread(filepath, stringsAsFactors = FALSE, data.table = FALSE, fill = fill_true)
  GWAS_sig <- GWAS[which(GWAS[ ,namepvariable] < 5e-08), ]
  return(GWAS_sig)}
"get_sig_SNP2" <- function(filepath, namepvariable){
  GWAS <- read.table(filepath, header = TRUE)
  GWAS_sig <- GWAS[which(GWAS[ ,namepvariable] < 5e-08), ]
  return(GWAS_sig)}
"arrange_function" <- function(DIS, pvalvar, bpvar){
  DIS <- DIS %>%
    mutate(min_rank_pval = min_rank(DIS[, pvalvar]),
           BP_int_lower = DIS[, bpvar] - 500000,
           BP_int_higher = DIS[, bpvar] + 500000) %>%
    arrange(min_rank_pval)
  return(DIS)}
"LD_function" <- function(DIS, chr_var, min_rank_pval, bp_var, snp_id_var, bp_int_lower_var, bp_int_higher_var){
  SNPset <- c()
  for (chr in DIS[, chr_var]){ # chr = chromosome in the dataset
    BP_int_comp <- c()
    for (i in DIS[, min_rank_pval]){ # i = most significant new SNP at that time
      if(!(DIS[, bp_var][i] %in% BP_int_comp)){
        SNPset <- c(SNPset, DIS[, snp_id_var][i]) # not due to LD
        BP_int_comp <- c(BP_int_comp, DIS[, bp_int_lower_var][i]:DIS[, bp_int_higher_var][i]) # bp interval for i
      }
    }
    DIS_selection <- filter(DIS, DIS[, snp_id_var] %in% SNPset)
    return(DIS_selection)}
}
############################## CTS analyses #########################
## full models coefficient
# cel type
"make_full_model" <- function(full_model_path, trait_category, disorder_name){
  full_model <- fread(file.path(path_data_models, full_model_path), data.table = FALSE)
  full_model$Category[54:68] <- c("ASC1", "ASC2", "END", "exCA1", 
                                  "exCA3", "exDG", "exPFC1", "exPFC2", 
                                  "GABA1", "GABA2", "MG", "NSC", "ODC1", "OPC", 
                                  "Unclassified")
  input_ct <- full_model %>%
    as_tibble() %>%
    mutate(
      trait_category = rep(trait_category, times = 68),
      trait = rep(disorder_name, times = 68),
      #      category = full_model$Category,
      cell_type_clean = full_model$Category,
      Coefficient = full_model$Coefficient,
      Coefficient_p = 2 * pnorm(-abs(full_model$`Coefficient_z-score`))
    )
  
  input_ct <- input_ct %>%
    mutate(
      Coefficient_q = qvalue(input_ct$Coefficient_p)$qvalue
    )
  
  input_ct_final <- input_ct[c(54:68),]
  return(input_ct_final)
}
# age groups
"make_full_model_agegroups" <- function(full_model_path, disorder_name){
  full_model <- fread(file.path(path_data_models_age, full_model_path), data.table = FALSE)
  # remove 500 bp interval L2
  L2_int_100 <- c(55, 58, 61, 64, 67, 70, 73, 76, 79, 82, 85, 88, 91, 94)
  L2_int_500 <- c(56, 59, 62, 65, 68, 71, 74, 77, 80, 83, 86, 89, 92, 95)
  full_model <- full_model[-c(L2_int_100, L2_int_500),]
  
  full_model$Category[54:67] <- c("Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                                  "Childhood", "Adolescence", "Adulthood",
                                  "Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                                  "Childhood", "Adolescence", "Adulthood")
  input_ct <- full_model %>%
    as_tibble() %>%
    mutate(
      trait_category = c(rep("Covariate", times = 53), rep("Hippocampus", times = 7), rep("Prefrontal Cortex", times = 7)),
      trait = rep(disorder_name, times = 67),
      #      category = full_model$Category,
      cell_type_clean = full_model$Category,
      Coefficient = full_model$Coefficient,
      Coefficient_p = 2 * pnorm(-abs(full_model$`Coefficient_z-score`))
    )
  
  input_ct <- input_ct %>%
    mutate(
      Coefficient_q = qvalue(input_ct$Coefficient_p)$qvalue
    )
  
  input_ct_final <- input_ct[c(54:67),]
  return(input_ct_final)
}
## full models enrichment
# cell type
"make_full_model_enrichment" <- function(full_model_path, trait_category, disorder_name){
  full_model <- fread(file.path(path_data_models, full_model_path), data.table = FALSE)
  full_model$Category[54:68] <- c("ASC1", "ASC2", "END", "exCA1", 
                                  "exCA3", "exDG", "exPFC1", "exPFC2", 
                                  "GABA1", "GABA2", "MG", "NSC", "ODC1", "OPC", 
                                  "Unclassified")
  input_ct <- full_model %>%
    as_tibble() %>%
    mutate(
      trait_category = rep(trait_category, times = 68),
      trait = rep(disorder_name, times = 68),
      #      category = full_model$Category,
      cell_type_clean = full_model$Category,
    )
  
  input_ct <- input_ct %>%
    mutate(
      Coefficient_q = qvalue(input_ct$Enrichment_p, pi0 = 1)$qvalue
    )
  
  input_ct_final <- input_ct[c(54:68),]
  return(input_ct_final)
}
# age group
"make_full_model_enrichment_agegroups" <- function(full_model_path, disorder_name){
  full_model <- fread(file.path(path_data_models_age, full_model_path), data.table = FALSE)
  # remove 500 bp interval L2
  L2_int_100 <- c(55, 58, 61, 64, 67, 70, 73, 76, 79, 82, 85, 88, 91, 94)
  L2_int_500 <- c(56, 59, 62, 65, 68, 71, 74, 77, 80, 83, 86, 89, 92, 95)
  full_model <- full_model[-c(L2_int_100, L2_int_500),]
  
  full_model$Category[54:67] <- c("Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                                  "Childhood", "Adolescence", "Adulthood",
                                  "Early Prenatal", "Middle Prenatal", "Late Prenatal", "Infancy", 
                                  "Childhood", "Adolescence", "Adulthood")
  input_ct <- full_model %>%
    as_tibble() %>%
      mutate(
        trait_category = c(rep("Covariate", times = 53), rep("Hippocampus", times = 7), rep("Prefrontal Cortex", times = 7)),
        trait = rep(disorder_name, times = 67),
      #      category = full_model$Category,
        cell_type_clean = full_model$Category,
    )
  
  input_ct <- input_ct %>%
    mutate(
      Coefficient_q = qvalue(input_ct$Enrichment_p, pi0 = 1)$qvalue
    )
  
  input_ct_final <- input_ct[c(54:67),]
  return(input_ct_final)
}

## univariate model
"make_univariate_model" <- function(uni_model_path){
  univariate_model <- fread(file.path(path_data_models, uni_model_path), data.table = FALSE)
  univariate_model$Category <- c("ASC1", "ASC2", "END", "exCA1", 
                                 "exCA3", "exDG", "exPFC1", "exPFC2", 
                                 "GABA1", "GABA2", "MG", "NSC", "ODC1", "OPC", 
                                 "Unclassified")
  return(univariate_model)
}
############################### plots ###############################
# ldsc network plot
"ldsc_network" <- function(inputfile, traitlist, namefile,
                           Q_threshold = .05, min_vertex_size = 6, max_vertex_size = 20,
                           max_edge_width = 10, type = "celltype", title = "titel") {
  # constants
  CT_Q_THRESHOLD = Q_threshold
  MIN_VERTEX_SIZE = min_vertex_size
  MAX_VERTEX_SIZE = max_vertex_size
  MAX_EDGE_WIDTH = max_edge_width
  
  ct = inputfile
  traitlist = traitlist
  ct_names = namefile
  
  if (type == "celltype"){
    cols = data.frame(category = c("CNS"),
                      color = c("#FFE014"))
  } else
    if (type == "agegroups"){
      cols = data.frame(category = c("Hippocampus", "Prefrontal Cortex"),
                        color = c("#FFE014", "#3B37C2"))
    } else {
      print("Ernie er zit een banaan in je oor.")
    }
  
  ct_names = merge(ct_names, cols, by = "category", all.x = T)
  ct_names$color = as.character(ct_names$color)
  ct = merge(ct, ct_names, by = "cell_type_clean")
  
  # construct graph
  ct_sig = ct %>% filter(Coefficient_q < CT_Q_THRESHOLD) %>%
    group_by(cell_type_clean, trait) %>%
    summarise(n = n(), q = min(Coefficient_q))
  
  rel_ct = data.frame(from = ct_sig$cell_type_clean,
                      to = ct_sig$trait,
                      directed = T,
                      weight = -log10(ct_sig$q),
                      q = ct_sig$q,
                      type = "ct")
  rel_ct$weight = rel_ct$weight / max(rel_ct$weight)
  g = graph.data.frame(rel_ct, directed=T)
  
  # layout
  l = layout_with_fr(g)
  l = norm_coords(l)
  V(g)$x = l[,1]
  V(g)$y = l[,2]
  
  # vertex visual
  is_trait_v = V(g)$name %in% traitlist$trait
  V(g)$color = "grey90"
  V(g)$color[is_trait_v] = traitlist$color[match(V(g)$name[is_trait_v], traitlist$trait)]
  V(g)$color[!is_trait_v] = ct_names$color[match(V(g)$name[!is_trait_v], ct_names$cell_type_clean)]
  V(g)$shape = ifelse(is_trait_v, "circle", "square")
  V(g)$label = V(g)$name
  V(g)$label.color = "black"
  V(g)$label.font = ifelse(is_trait_v, 2, 4)
  V(g)$label.family = "sans"
  V(g)$label.cex = .7 #.3, .65, origineel .7
  V(g)$label.degree = pi/2
  V(g)$size = 6
  
  ct_sig_trait_n = ct %>% filter(Coefficient_q < CT_Q_THRESHOLD) %>% group_by(trait) %>% count()
  n_v_cls = 16;
  v_cls_ct = cut2(ct_sig_trait_n$n[match(V(g)$name[is_trait_v], ct_sig_trait_n$trait)], g = n_v_cls)
  v_size_ct = seq(MIN_VERTEX_SIZE, MAX_VERTEX_SIZE, length.out = n_v_cls)[match(v_cls_ct, levels(v_cls_ct))]
  V(g)$size[is_trait_v] = v_size_ct
  
  ct_sig_cell_n = ct %>% filter(Coefficient_q < CT_Q_THRESHOLD) %>% group_by(cell_type_clean) %>% summarise(n = length(unique(trait)))
  n_v_cls = 16;
  v_cls_ct = cut2(ct_sig_cell_n$n[match(V(g)$name[!is_trait_v], ct_sig_cell_n$cell_type_clean)], g = n_v_cls)
  v_size_ct = seq(MIN_VERTEX_SIZE, MAX_VERTEX_SIZE, length.out = n_v_cls)[match(v_cls_ct, levels(v_cls_ct))]
  V(g)$size[!is_trait_v] = v_size_ct
  

  ct_cols = c("#F7F7F7", "seagreen", "gold", "deeppink")
  edge_cls_ct = cut2(-log10(ct_sig$q), cuts = c(0, -log10(0.05), -log10(.01), -log10(.001), ceiling(max(-log10(ct_sig$q)))))
  edge_color_ct = ct_cols[match(edge_cls_ct, levels(edge_cls_ct))]
  
  
  edge_width = -log10(ct_sig$q) #/ 6
  edge_width[edge_width > MAX_EDGE_WIDTH] = MAX_EDGE_WIDTH
  
  E(g)$color = edge_color_ct
  E(g)$width = edge_width
  E(g)$curved = .2
  E(g)$arrow.size = -log10(ct_sig$q) / 4 #8
  
  
  ldsc_plot <- plot(g, rescale = F, main = title)
  
  return(ldsc_plot)
}

# plot enrichment + coefficient for age
"plot_agegroups" <- function(disorder, brain_region, trait_name){
  selection <- input_age_enrichment %>%
    mutate(is_sig = Coefficient_q < .05, "Significant", "Nonsignificant")
  
  selection$Category <- factor(selection$Category, 
                               order = TRUE, 
                               levels = c("Early Prenatal", "Middle Prenatal", "Late Prenatal",
                                          "Infancy", "Childhood", "Adolescence", "Adulthood")
  )
  
  colours <- c(
    "TRUE" = "blue",
    "FALSE" = "red")
  
  fig_trait <- selection %>% 
    filter(trait == disorder, trait_category == brain_region) %>%
    ggplot(selection, mapping = aes(Category, Enrichment, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    scale_colour_manual(
      values = colours,
      limits = names(colours)) +
    geom_errorbar(aes(ymin = Enrichment - Enrichment_std_error, 
                      ymax = Enrichment + Enrichment_std_error), 
                  width = .25,
                  alpha = .4) +
    ggtitle(trait_name) +
    theme(plot.title = element_text(size = 7, 
                                    face="bold", 
                                    margin = margin(10, 0, 10, 0))) +
    labs(x = "Age", 
         y = "Enrichment") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90')) +
    geom_smooth(method = "lm", se = FALSE,
                col = "blue")
  
  fig_control <- selection %>% 
    filter(trait == "HGHT", trait_category == brain_region) %>%
    ggplot(selection, mapping = aes(Category, Enrichment, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    geom_errorbar(aes(ymin = Enrichment - Enrichment_std_error, 
                      ymax = Enrichment + Enrichment_std_error), 
                  width = .25,
                  alpha = .4) +
    scale_colour_manual(
      values = colours,
      limits = names(colours))+
    ggtitle("Height - control") +
    theme(plot.title = element_text(size = 7, 
                                    face="bold", 
                                    margin = margin(10, 0, 10, 0))) +
    labs(x = "Age", 
         y = "Enrichment") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90')) +
    geom_smooth(method = "lm", se = FALSE,
                col = "blue")
  
  selection <- input_age %>%
    mutate(is_sig = Coefficient_q < .05, "Significant", "Nonsignificant")
  
  selection$Category <- factor(selection$Category, 
                               order = TRUE, 
                               levels = c("Early Prenatal", "Middle Prenatal", "Late Prenatal",
                                          "Infancy", "Childhood", "Adolescence", "Adulthood")
  )
  fig_trait_coef <- selection %>% 
    filter(trait == disorder, trait_category == brain_region) %>%
    ggplot(selection, mapping = aes(Category, Coefficient, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    geom_errorbar(aes(ymin = Coefficient - Coefficient_std_error, 
                      ymax = Coefficient + Coefficient_std_error), 
                  width = .25,
                  alpha = .4) +
#    ggtitle(trait_name) +
#    theme(plot.title = element_text(size = 7, 
#                                    face="bold", 
#                                    margin = margin(10, 0, 10, 0))) +
    scale_colour_manual(
      values = colours,
      limits = names(colours)) +
    labs(x = "Age", 
         y = "Coefficient") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90')) +
    geom_smooth(method = "lm", se = FALSE,
                col = "blue")
  
  plot_grid(fig_trait, fig_control,
            fig_trait_coef,
            align = "hv")
}
####################################
# plot enrichment + coefficient for cell type
"plot_celltype" <- function(disorder, trait_name){
  selection <- input_ct_enrichment %>%
    mutate(is_sig = Coefficient_q < .05, "Significant", "Nonsignificant")
  
  selection$Category <- factor(selection$Category, 
                               order = TRUE, 
                               levels = c("ASC1", "ASC2", "END", "exCA1", 
                                          "exCA3", "exDG", "exPFC1", "exPFC2", 
                                          "GABA1", "GABA2", "MG", "NSC", "ODC1", "OPC", 
                                          "Unclassified")
  )
  
  colours <- c(
    "TRUE" = "blue",
    "FALSE" = "red")
  
  fig_trait <- selection %>% 
    filter(trait == disorder) %>%
    ggplot(selection, mapping = aes(Category, Enrichment, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    geom_errorbar(aes(ymin = Enrichment - Enrichment_std_error, 
                      ymax = Enrichment + Enrichment_std_error), 
                  width = .25,
                  alpha = .4) +
    scale_colour_manual(
      values = colours,
      limits = names(colours)) +
    ggtitle(trait_name) +
    theme(plot.title = element_text(size = 7, 
                                    face="bold", 
                                    margin = margin(10, 0, 10, 0))) +
    labs(x = "Cell type", 
         y = "Enrichment") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90'))# +
    #geom_smooth(method = "lm", se = FALSE,
    #            col = "firebrick")
  
  fig_control <- selection %>% 
    filter(trait == "HGHT") %>%
    ggplot(selection, mapping = aes(Category, Enrichment, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    geom_errorbar(aes(ymin = Enrichment - Enrichment_std_error, 
                      ymax = Enrichment + Enrichment_std_error), 
                  width = .25,
                  alpha = .4) +
    scale_colour_manual(
      values = colours,
      limits = names(colours)) +
    ggtitle("Height - control") +
    theme(plot.title = element_text(size = 7, 
                                    face="bold", 
                                    margin = margin(10, 0, 10, 0))) +
    labs(x = "Cell type", 
         y = "Enrichment") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90'))# +
    #geom_smooth(method = "lm", se = FALSE,
    #            col = "firebrick")
  
  selection <- input_ct %>%
    mutate(is_sig = Coefficient_q < .05, "Significant", "Nonsignificant")
  
  selection$Category <- factor(selection$Category, 
                               order = TRUE, 
                               levels = c("ASC1", "ASC2", "END", "exCA1", 
                                          "exCA3", "exDG", "exPFC1", "exPFC2", 
                                          "GABA1", "GABA2", "MG", "NSC", "ODC1", "OPC", 
                                          "Unclassified")
  )
  fig_trait_coef <- selection %>% 
    filter(trait == disorder) %>%
    ggplot(selection, mapping = aes(Category, Coefficient, group = 1)) +
    geom_point(alpha = 1, 
               size = 3,
               aes(color = is_sig),
               show.legend = FALSE) +
    geom_errorbar(aes(ymin = Coefficient - Coefficient_std_error, 
                      ymax = Coefficient + Coefficient_std_error), 
                  width = .25,
                  alpha = .4) +
    scale_colour_manual(
      values = colours,
      limits = names(colours)) +
    #ggtitle(trait_name) +
   # theme(plot.title = element_text(size = 12, 
   #                                 face="bold", 
  #                                  margin = margin(10, 0, 10, 0))) +
    labs(x = "Cell type", 
         y = "Coefficient") +
    theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1)) +
    theme(panel.background = element_rect(fill = 'Grey90'))# +
    #geom_smooth(method = "lm", se = FALSE,
    #            col = "firebrick")

  plot_grid(fig_trait, fig_control,
            fig_trait_coef,
            align = "hv"
            )
}

# controlling enrichment for height
"control_for_height" <- function(input, Nse = 1){
  input_enrichment_diff <- input %>%
    mutate(
      lower_range = Enrichment - (Nse * Enrichment_std_error),
      higher_range = Enrichment + (Nse * Enrichment_std_error)
    )
  HGHT_control <- input_enrichment_diff %>%
    filter(trait == "HGHT")
  
  input_enrichment_diff$lower_range_control <- rep(HGHT_control$lower_range, times = 13)
  input_enrichment_diff$higher_range_control <- rep(HGHT_control$higher_range, times = 13)
  
  input_enrichment_diff$lower_than_control <- ifelse(input_enrichment_diff$higher_range < input_enrichment_diff$lower_range_control, 1, 0)
  input_enrichment_diff$higher_than_control <- ifelse(input_enrichment_diff$lower_range > input_enrichment_diff$higher_range_control, 1, 0)
  
  
  input_enrichment_controlled <- filter(input_enrichment_diff, (lower_than_control == 1) | (higher_than_control == 1))
  input_enrichment_controlled2 <- filter(input_enrichment_controlled, ((Coefficient - Coefficient_std_error) < 0) & ((Coefficient + Coefficient_std_error) > 0) )
  
  input_enrichment_controlled_sig <- filter(input_enrichment_controlled2, Coefficient_q < .05)
  input_enrichment_controlled_sig$Enrichment_p <- formatC(input_enrichment_controlled_sig$Enrichment_p, digits = 2, format = "e")
  
  return(input_enrichment_controlled_sig)
}



