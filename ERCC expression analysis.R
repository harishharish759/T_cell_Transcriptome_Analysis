##ERCC spike in RNA analysis

library(DESeq2)

#read the ERCC sample table, "sample_sheet_ercc.txt"

sampletable <- read.table('sample_sheet_ercc.txt', header=T, sep="\t") # add the path to sample_table.txt here

#create a DESeq DataSet object "ercc_dd", designed over the variable Mix

ercc_dd <- DESeqDataSetFromHTSeqCount(sampleTable = sampletable,
                                      directory = "G:/RNAseq analysis/analysis01/ercc",
                                      design = ~ Mix)

#create an object "ercc_dds" with DESeq2 normalized expression   

ercc_dds <- DESeq(ercc_dd)

#create the object "res_ercc", with the ratio of Mix2 vs Mix1

res_ercc <- results(object = ercc_dds)

write.table(res_ercc, "ercc2_vs_ercc1_deseq2_results.txt", quote=F, col.names=T, row.names=T, sep="\t") 

#visualize the results of ercc_dds object,

library(ReportingTools)

des2Report <- HTMLReport(shortName = 'ERCC',
                         title = 'ERCC',
                         reportDirectory = "reports")

colData(ercc_dds)$Mix <- factor(colData(ercc_dds)$Mix, levels=c("M1", "M2"))
publish(ercc_dds,des2Report, pvalueCutoff=1,
        annotation.db=NULL, factor=colData(ercc_dds)$Mix,
        reportDir="./reports")
finish(des2Report)



#create heatmap for the spike in RNA

library(pheatmap)
norm_counts <- log2(counts(ercc_dds, normalized = TRUE)+1)
exp_sel_heatmap <- pheatmap(norm_counts, cluster_cols = FALSE, legend = TRUE)

save_pheatmap_pdf <- function(x, filename, width=7, height=7) {
  stopifnot(!missing(x))
  stopifnot(!missing(filename))
  pdf(filename, width=width, height=height)
  grid::grid.newpage()
  grid::grid.draw(x$gtable)
  dev.off()
}

save_pheatmap_pdf(exp_sel_heatmap, "ercc_counts_heatmap.pdf")
