#to perform differential gene expression analysis on ERCC spike-in RNA using DESeq2

#load the required libraries  

library(DESeq2)

#load the ERCC sample sheet (found in folder "Raw counts")

sampletable_ercc <- read.table('Raw counts/sample_sheet_ercc.txt', header=T, sep="\t")

#load the raw counts files (created using the script '*shell script*' )

ercc_dd <- DESeqDataSetFromHTSeqCount(sampleTable = sampletable_ercc,
                                      directory = "Raw counts/ercc_counts",
                                      design = ~ Mix)

ercc_dds <- DESeq(ercc_dd)

#write results of ERCC_DGE analysis between Mix2 and Mix1 and save as text file

res_ercc <- results(object = ercc_dds,  name="Mix_M2_vs_M1")

write.table(res_ercc, "M2_vs_M1_deseq2_results.txt", quote=F, col.names=T, row.names=T, sep="\t")