#to create file wtih mean of log2 trnasformed normalized (DESeq2) counts

#start with the DESeq2 object created using the script 'DGE_analysis.R'

#apply log2 function on normalized counts 

norm_counts <- log2(counts(se_star2, normalized = TRUE)+1)

norm_counts.df <- as.data.frame(norm_counts)

#calculate the mean of the values for each time point

samples <- c("2-", "3-","4-","5-","6-","7-","9-","11-")

norm_counts.df.t1 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 1, sep="")]))
norm_counts.df.t2 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 2, sep="")]))
norm_counts.df.t3 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 3, sep="")])) 
norm_counts.df.t4 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 4, sep="")])) 
norm_counts.df.t5 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 5, sep="")])) 
norm_counts.df.t6 <- data.frame(rowMeans(norm_counts.df[,paste(samples, 6, sep="")])) 

norm_counts.df.averages <- data.frame()
norm_counts.df.averages <-cbind(norm_counts.df.t1, norm_counts.df.t2, norm_counts.df.t3, norm_counts.df.t4, norm_counts.df.t5, norm_counts.df.t6)

#remane the time points in terms of t1 


names(norm_counts.df.averages)[1] <- "t1"
names(norm_counts.df.averages)[2] <- "t2"
names(norm_counts.df.averages)[3] <- "t3"
names(norm_counts.df.averages)[4] <- "t4"
names(norm_counts.df.averages)[5] <- "t5"
names(norm_counts.df.averages)[6] <- "t6"

#dataframe norm_counts.df.averages now contains mean of log2 vlaues of normalized counts
#write to a .txt file

write.table(norm_counts.df.averages, "mydata.txt", quote=F, col.names=T, row.names=T, sep="\t")