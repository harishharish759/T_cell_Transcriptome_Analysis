#to perform differential gene expression analysis on raw counts using DESeq2 

#load the required libraries  

library(DESeq2)

#load the sample sheet (found in folder "Raw counts")

sampletable <- read.table('Raw counts/sample_sheet.txt', header=T, sep="\t")  #set path for sample table

#load the raw counts files (created in the in the using the script 'raw counts files with HGNC symbol.R' )

se_star <- DESeqDataSetFromHTSeqCount(sampleTable = sampletable,
                                      directory = "Raw counts/hg38_counts",
                                      design = ~ Time)

se_star2 <- DESeq(se_star)

#write results of DGE analysis for two time points and save as text file

res <- results(object = se_star2, name="Time_t6_vs_t1") # you can adjust the timepoints to compare here, i.e. Time_t2_vs_t1, Time_t3_vs_t1, etc

write.table(res, "t6_vs_t1_deseq2_results.txt", quote=F, col.names=T, row.names=T, sep="\t") 