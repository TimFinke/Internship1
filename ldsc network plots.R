# LDSC network cell type enrichment
ts = as.numeric(Sys.time())
out_fname = sprintf("./images/network_ct_%.0f", ts)
png(str_c(out_fname, ".png"), width = 9, height = 9, units = "in", res = 300)
ldsc_network(input_ct_enrichment, trait_list_ct, ct_names,
             type = "celltype", min_vertex_size = 16, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

pdf(str_c(out_fname, ".pdf"), width = 9, height = 9)
ldsc_network(input_ct_enrichment, trait_list_ct, ct_names,
             type = "celltype", min_vertex_size = 16, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

# LDSC network for cell type-specific enrichment coefficients
ts = as.numeric(Sys.time())
out_fname = sprintf("./images/network_ct_coef_%.0f", ts)
png(str_c(out_fname, ".png"), width = 9, height = 9, units = "in", res = 300)
ldsc_network(input_ct, trait_list_ct, ct_names,
             type = "celltype", min_vertex_size = 16, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

pdf(str_c(out_fname, ".pdf"), width = 9, height = 9)
ldsc_network(input_ct, trait_list_ct, ct_names,
             type = "celltype", min_vertex_size = 16, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

# LDSC network for age group enrichment
ts = as.numeric(Sys.time())
out_fname = sprintf("./images/network_age_%.0f", ts)
png(str_c(out_fname, ".png"), width = 9, height = 9, units = "in", res = 300)
ldsc_network(input_age_enrichment, trait_list_age, age_names,
             type = "agegroups", min_vertex_size = 12, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

pdf(str_c(out_fname, ".pdf"), width = 9, height = 9)
ldsc_network(input_age_enrichment, trait_list_age, age_names,
             type = "agegroups", min_vertex_size = 12, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

# LDSC network for age group-specific enrichment coefficients
ts = as.numeric(Sys.time())
out_fname = sprintf("./images/network_age_coef_%.0f", ts)
png(str_c(out_fname, ".png"), width = 9, height = 9, units = "in", res = 300)
ldsc_network(input_age, trait_list_age, age_names,
             type = "agegroups", min_vertex_size = 17, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()

pdf(str_c(out_fname, ".pdf"), width = 9, height = 9)
ldsc_network(input_age, trait_list_age, age_names,
             type = "agegroups", min_vertex_size = 17, max_vertex_size = 20,
             max_edge_width = 10, title = " ")
dev.off()




