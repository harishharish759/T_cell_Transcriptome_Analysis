# T_cell_Transcriptome_Analysis
The scripts and software used for whole transcriptome data analysis of ex vivo T cells.

### Associated Publication
doi, pubmed id, etc

### Publication Abstract
what is this about?

### GEO Link to raw data: 
GSE250311
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
    
