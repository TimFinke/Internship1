# Internship1
## Scripts used for internship I

Unix shell scripts were used on the Lisa Compute Cluster of SURFsara using modules "2019" and "Anaconda3".  In most cases Python3 was used with dependencies bitarray (0.8.3), nose (1.3.7), pybedtools (0.8.0), scipy (1.2.1), pandas (0.24.2), and numpy (1.18.1). However, the LDSC software had some compatibility issues for Python3, hence incidental switches were made to Python2 with diﬀerent version for pandas (0.18.1) and numpy (1.15.4).

LDSC software was orignally written in Python2 by Bulik-Sulivan et al. (2015) and can be found here: https://github.com/bulik/ldsc. A Python3-compatible version can be found here: https://github.com/shz9/ldsc.
The original shell script for the rg-matrix can be found here: https://github.com/hillfung/rg-matrix.
Annotation files were constructed in R using functions available here: https://github.com/hillfung/make_LDSR_annot.
LDSC network plots were adapted from R code of Kanai et al. (2018), which can be found here: https://github.com/mkanai/ldsc-network-plot.

A wide array of R packages has been used for plotting ﬁgures, calculating the number of signiﬁcant GWAS loci per disorder, and performing analyses of developmental periodand cell type-speciﬁc enrichment, diﬀerential expression of developmental periods, and making annotation ﬁles for these developmental periods. For this, we made use of R (Version 3.6.2; R Core Team, 2019) and the R-packages Biobase (Version 2.46.0; W. Huber et al., 2015), BiocGenerics (Version 0.32.0; Huber et al., 2015), BiocParallel (Version 1.20.1; M. Morgan et al., 2019b), corrplot2017 (Wei & Simko, 2017), cowplot (Version 1.0.0; Wilke, 2019), data.table (Version 1.12.8; Dowle & Srinivasan, 2019), DelayedArray (Version 0.12.2; Pagès, Peter Hickey, & Lun, 2020), DESeq2 (Version 1.26.0; Love et al., 2014), dplyr (Version 0.8.4; Wickham et al., 2020), forcats (Version 0.4.0; Wickham, 2019a), Formula (Version 1.2.3; Zeileis & Croissant, 2010), GenomeInfoDb (Version 1.22.0; Arora, Morgan, Carlson, & Pagès, 2019), GenomicRanges (Version 1.38.0; M. Lawrence et al., 2013a), ggplot2 (Version 3.2.1; Wickham, 2016), Hmisc (Version 4.3.0; Harrell Jr, Charles Dupont, & others., 2019), igraph (Version 1.2.4.2; Csardi & Nepusz, 2006), IRanges (Version 2.20.1; M. Lawrence et al., 2013b), kableExtra (Version 1.1.0; Zhu, 2019), lattice (Version 0.20.38; Sarkar, 2008), matrixStats (Version 0.55.0; Bengtsson, 2019), papaja (Version 0.1.0.9942; Aust & Barth, 2020), purrr (Version 0.3.3; Henry & Wickham, 2019), qgraph (Version 1.6.4; Epskamp, Cramer, Waldorp, Schmittmann, & Borsboom, 2012), qvalue (Version 2.18.0; Storey, Bass, Dabney, & Robinson, 2019), RColorBrewer (Version 1.1.2; Neuwirth, 2014), readr (Version 1.3.1; Wickham, Hester, & Francois, 2018), S4Vectors (Version 0.24.1; Pagès, Lawrence, & Aboyoun, 2019), stringr (Version 1.4.0; Wickham, 2019b), SummarizedExperiment (Version 1.16.1; M. Morgan et al., 2019a), survival (Version 3.1.8; Terry M. Therneau & Patricia M. Grambsch, 2000), tibble (Version 2.1.3; Müller & Wickham, 2019), tidyr (Version 1.0.2; Wickham & Henry, 2020), and tidyverse (Version 1.3.0; Wickham, Averick, et al., 2019).

## References:

### Genetic correlation

Bulik-Sullivan, B., et al. An Atlas of Genetic Correlations across Human Diseases and Traits. Nature Genetics, 2015. Preprint available on bioRxiv doi: http://dx.doi.org/10.1101/014498

### Partitioned heritability

Finucane, HK, et al. Partitioning heritability by functional annotation using genome-wide association summary statistics. Nature Genetics, 2015. Preprint available on bioRxiv doi: http://dx.doi.org/10.1101/014241

### LDSC network plots

Kanai, M., et al. Genetic analysis of quantitative traits in the Japanese population links cell types to complex human diseases. Nat. Genet. (2018) doi:10.1038/s41588-018-0047-6

### R-packages
Arora, S., Morgan, M., Carlson, M., & Pagès, H. (2019). GenomeInfoDb: Utilities for manipulating chromosome names, including modifying them to follow a particular naming style.

Aust, F., & Barth, M. (2020). papaja: Create APA manuscripts with R Markdown. Retrieved from https://github.com/crsh/papaja

Bengtsson, H. (2019). MatrixStats: Functions that apply to rows and columns of matrices (and to vectors). Retrieved from https://CRAN.R-project.org/package=matrixStats

Csardi, G., & Nepusz, T. (2006). The igraph software package for complex network research. InterJournal, Complex Systems, 1695. Retrieved from http://igraph.org

Dowle, M., & Srinivasan, A. (2019). Data.table: Extension of ‘data.frame‘. Retrieved from https://CRAN.R-project.org/package=data.table

Epskamp, S., Cramer, A. O. J., Waldorp, L. J., Schmittmann, V. D., & Borsboom, D. (2012). qgraph: Network visualizations of relationships in psychometric data. Journal of Statistical Software, 48(4), 1–18. Retrieved from http://www.jstatsoft.org/v48/i04/

Harrell Jr, F. E., Charles Dupont, & others. (2019). Hmisc: Harrell miscellaneous. Retrieved from https://CRAN.R-project.org/package=Hmisc

Henry, L., & Wickham, H. (2019). Purrr: Functional programming tools. Retrieved from https://CRAN.R-project.org/package=purrr

Huber, W., Carey, V. J., Gentleman, R., Anders, S., Carlson, M., Carvalho, B. S., ... Morgan, M. (2015). Orchestrating high-throughput genomic analysis with Bioconductor. Nature 
Methods, 12(2), 115–121. Retrieved from http://www.nature.com/nmeth/journal/v12/n2/full/nmeth.3252.html

Huber, W., Carey, J., V., Gentleman, R., ... M. (2015). Orchestrating high-throughput genomic analysis with Bioconductor. Nature Methods, 12(2), 115–121. Retrieved from http://www.nature.com/nmeth/journal/v12/n2/full/nmeth.3252.html

Lawrence, M., Huber, W., Pagès, H., Aboyoun, P., Carlson, M., Gentleman, R., ... Carey, V. (2013a). Software for computing and annotating genomic ranges. PLoS Computational Biology, 9(8). https://doi.org/10.1371/journal.pcbi.1003118

Lawrence, M., Huber, W., Pagès, H., Aboyoun, P., Carlson, M., Gentleman, R., ... Carey, V. (2013b). Software for computing and annotating genomic ranges. PLoS Computational Biology, 9(8). https://doi.org/10.1371/journal.pcbi.1003118

Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for rna-seq data with deseq2. Genome Biology, 15(12), 550. https://doi.org/10.1186/s13059-014-0550-8

Morgan, M., Obenchain, V., Hester, J., & Pagès, H. (2019a). SummarizedExperiment: SummarizedExperiment container.

Morgan, M., Obenchain, V., Lang, M., Thompson, R., & Turaga, N. (2019b). BiocParallel: Bioconductor facilities for parallel evaluation. Retrieved from https://github.com/Bioconductor/BiocParallel

Müller, K., & Wickham, H. (2019). Tibble: Simple data frames. Retrieved from https://CRAN.R-project.org/package=tibble

Neuwirth, E. (2014). RColorBrewer: ColorBrewer palettes. Retrieved from https://CRAN.R-project.org/package=RColorBrewer

Pagès, H., Lawrence, M., & Aboyoun, P. (2019). S4Vectors: Foundation of vector-like and list-like containers in bioconductor.

Pagès, H., Peter Hickey, & Lun, A. (2020). DelayedArray: A uniﬁed framework for working transparently with on-disk and in-memory array-like datasets.

R Core Team. (2019). R: A language and environment for statistical computing. Vienna, Austria: R Foundation for Statistical Computing. Retrieved from https://www.R-project.org/

Sarkar, D. (2008). Lattice: Multivariate data visualization with r. New York: Springer. Retrieved from http://lmdvr.r-forge.r-project.org

Storey, J. D., Bass, A. J., Dabney, A., & Robinson, D. (2019). Qvalue: Q-value estimation for false discovery rate control. Retrieved from http://github.com/jdstorey/qvalue Strachan, T., & Read, A. (2019). Human molecular genetics. (5th ed.). Garland Science. Terry M. Therneau, & Patricia M. Grambsch. (2000). Modeling survival data: Extending the Cox model. New York: Springer. The 1000 Genomes Project Consortium. (2015). A global reference for human genetic variation. Nature, 526 (7571), 68–74. https://doi.org/10.1038/nature15393 The International HapMap3 Consortium. (2010). Integrating common and rare genetic variation in diverse human populations. Nature, 467(7311), 52–58. https://doi.org/10.1038/nature09298

Wei, T., & Simko, V. (2017). R package "corrplot": Visualization of a correlation matrix. Retrieved from https://github.com/taiyun/corrplot

Wickham, H. (2016). Ggplot2: Elegant graphics for data analysis. Springer-Verlag New York. Retrieved from https://ggplot2.tidyverse.org

Wickham, H. (2019a). Forcats: Tools for working with categorical variables (factors). Retrieved from https://CRAN.R-project.org/package=forcats

Wickham, H. (2019b). Stringr: Simple, consistent wrappers for common string operations. Retrieved from https://CRAN.R-project.org/package=stringr

Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L. D., François, R., ... Yutani, H. (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686

Wickham, H., François, R., Henry, L., & Müller, K. (2020). Dplyr: A grammar of data manipulation. Retrieved from https://CRAN.R-project.org/package=dplyr

Wickham, H., & Henry, L. (2020). Tidyr: Tidy messy data. Retrieved from https://CRAN.R-project.org/package=tidyr

Wickham, H., Hester, J., & Francois, R. (2018). Readr: Read rectangular text data. Retrieved from https://CRAN.R-project.org/package=readr

Wilke, C. O. (2019). Cowplot: Streamlined plot theme and plot annotations for ’ggplot2’. Retrieved from https://CRAN.R-project.org/package=cowplot

Zeileis, A., & Croissant, Y. (2010). Extended model formulas in R: Multiple parts and multiple responses. Journal of Statistical Software, 34(1), 1–13. https://doi.org/10.18637/jss.v034.i01

Zhu, H. (2019). KableExtra: Construct complex table with ’kable’ and pipe syntax. Retrieved from https://CRAN.R-project.org/package=kableExtra
