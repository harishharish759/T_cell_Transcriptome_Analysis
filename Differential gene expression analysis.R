##Differential gene expression analysis using DESeq2

#set the working directory and add the sample table file "sample_sheet.txt" and raw count files in the folder "counts"

setwd("G:/RNAseq analysis")  

library(DESeq2)

#read the sample table

sampletable <- read.table('sample_sheet.txt', header=T, sep="\t") 

#create a DESeq DataSet object "se_star", designed over the varibale Time

se_star <- DESeqDataSetFromHTSeqCount(sampleTable = sampletable,
                                      directory = "G:/RNAseq analysis/counts/hg38",
                                      design = ~ Time)

#create an object "se_star2" witth Differential Gene Expression(DGE) Analysi data

se_star2 <- DESeq(se_star)

#create the object "res" with results of DGE between two time points, timepoints can be ajusted to compare different time points, i.e. Time_t2_vs_t1, Time_t3_vs_t1, etc

res <- results(object = se_star2, name="Time_t6_vs_t1") # 

#save results of DGE as .txt file

write.table(res, "t6_vs_t1_deseq2_results.txt", quote=F, col.names=T, row.names=T, sep="\t") 

#to save results of DGE as .txt file with specific padj valaue, here padj <= 0.05 

res.nona <- res[complete.cases(res),]
res.nona.padj05 <- res.nona[res.nona$padj <= 0.05, ]
write.table(res.nona.padj05, "t6_vs_t1_deseq2_results_nona_padj05.txt", quote=F, col.names=T, row.names=T, 
            sep="\t")
