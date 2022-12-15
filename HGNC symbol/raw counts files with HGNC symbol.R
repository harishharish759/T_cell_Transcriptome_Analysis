library(biomaRt)

#to create raw count files with HGNC symbol from raw count files with ensembl ID#

#read the ensembl ID of transcripts present in raw counts file

ensembl_ids <- read.csv("2-1.ReadsPerGeneCol4.tab", sep="\t", header = FALSE)[,1]

#create a data frame of HGNC symbol and the respective ensembl ID
mart <- useMart("ensembl", dataset="hsapiens_gene_ensembl")
attributes=c('ensembl_gene_id','hgnc_symbol')

ens_hgnc_list <- getBM(attributes=attributes, mart=mart, filters="ensembl_gene_id",values=ensembl_ids)

ens_hgnc_list<- data.frame(ens_hgnc_list)


#loop over all files and replace ensembl ID by HGNC symbol and save the files in a new folder "hg38"

ensembl_count_files <- list.files(path="counts/ensembl_id/", pattern="*.tab", full.names=TRUE, recursive=FALSE)

library(stringr)

dir.create("hg38")

lapply(ensembl_count_files, function(x) {
  
  df_ens_counts <- data.frame(read.csv(x, sep="\t", header = FALSE))
  names(df_ens_counts)[1] <- "ensembl_gene_id"
  names(df_ens_counts)[2] <- "counts"
  
  df_ens_counts_merge <- merge(df_ens_counts, ens_hgnc_list, by=c("ensembl_gene_id"))
  
  df_ens_counts_merge.file <- df_ens_counts_merge[, c("hgnc_symbol", "counts")]
  
  df_ens_counts_merge.file.clean <- df_ens_counts_merge.file[!(df_ens_counts_merge.file$hgnc_symbol==""),]
  
  
  hgnc_filename <- str_replace(x, "counts/ensembl_id/", "" )
  write.table(df_ens_counts_merge.file.clean, paste("counts/hg38/",hgnc_filename, sep=""), row.names = FALSE, col.names = FALSE, sep = "\t", quote=FALSE)
})

#####
