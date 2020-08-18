# Internship1
## Scripts used for internship I

Unix shell scripts were used on the Lisa Compute Cluster of SURFsara using modules "2019" and "Anaconda3".  In most cases Python3 was used with dependencies bitarray (0.8.3), nose (1.3.7), pybedtools (0.8.0), scipy (1.2.1), pandas (0.24.2), and numpy (1.18.1). However, the LDSC software had some compatibility issues for Python3, hence incidental switches were made to Python2 with diﬀerent version for pandas (0.18.1) and numpy (1.15.4).

LDSC software was orignally written in Python2 by Bulik-Sulivan et al. (2015) and can be found here: https://github.com/bulik/ldsc. A Python3-compatible version can be found here: https://github.com/shz9/ldsc.
The original shell script for the rg-matrix can be found here: github.com/hillfung/rg-matrix.
Annotation files were constructed in R using functions available here: https://github.com/hillfung/make_LDSR_annot.
LDSC network plots were adapted from R code of Kanai et al. (2018), which can be found here: https://github.com/mkanai/ldsc-network-plot.


References:

For genetic correlation: Bulik-Sullivan, B., et al. An Atlas of Genetic Correlations across Human Diseases and Traits. Nature Genetics, 2015. Preprint available on bioRxiv doi: http://dx.doi.org/10.1101/014498
For partitioned heritability: Finucane, HK, et al. Partitioning heritability by functional annotation using genome-wide association summary statistics. Nature Genetics, 2015. Preprint available on bioRxiv doi: http://dx.doi.org/10.1101/014241
For LDSC network plots: Kanai, M., et al. Genetic analysis of quantitative traits in the Japanese population links cell types to complex human diseases. Nat. Genet. (2018) doi:10.1038/s41588-018-0047-6
