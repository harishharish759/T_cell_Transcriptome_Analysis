# T_cell_Transcriptome_Analysis
The scripts and software used for whole transcriptome data analysis of ex vivo T cells. (Question for Max: do I mention here that the analysis script available here is also for the thesis)

### Associated Publication
copy paste the Title, doi, pubmed id, etc of the publication here

### Publication Abstract
copy paste the abstract of the publication here

### GEO Link to raw data: 
GSE250311\
Link: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE250311

### Requirements
#### Software

#### R libraries 
R (v..)
DEseq2
...

### Structure
```
Raw count files
	ercc
		.txt
	ensembl
		.txt
scripts
	processing
		0_alignment.sh
		1_counting.sh
		...
		3_ensembl_to_hgnc.R
		4_dge_analysis.R
		5_ercc_dge_analysis.R
		6_split_ercc_from_native_genes.sh?
	figures
		cluster_and_heatmap.R
		vulcano...
		heatmap...
		etc...
  ```  
    
