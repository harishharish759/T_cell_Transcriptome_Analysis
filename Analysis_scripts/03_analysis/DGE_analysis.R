#to perform differential gene expression analysis on raw counts using DESeq2 

#load the required libraries  

library(DESeq2)

#load the sample sheet (found in folder "Raw counts")

sampletable <- read.table('Raw counts/sample_sheet.txt', header=T, sep="\t")  #set path for sample table

#load the raw counts files (created using the script 'raw counts files with HGNC symbol.R' ) and build the DESeq dataset

se_star <- DESeqDataSetFromHTSeqCount(sampleTable = sampletable,
                                      directory = "Raw counts/hg38_counts",
                                      design = ~ Time)

#perform differential gene expression analysis

se_star2 <- DESeq(se_star)


#perfrom lfcshrink and write results of DGE analysis for two selected time points and save as text file

resultsNames(se_star2)  #provides the name  of the coefficient for results, i.e. Time_t2_vs_t1, Time_t3_vs_t1, etc

resLFC <- lfcShrink(se_star2, coef = "Time_t6_vs_t1" , type = "apeglm") 

write.table(resLFC, "t6_vs_t1_deseq2_results.txt", quote=F, col.names=T, row.names=T, sep="\t") 
