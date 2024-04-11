# T_cell_Transcriptome_Analysis
The scripts and software used for whole transcriptome data analysis of ex vivo T cells. (Question for Max: do I mention here that the analysis script available here is also for the thesis)

### Associated Publication
copy paste the Title, doi, pubmed id, etc of the publication here

### Publication Abstract
copy paste the abstract of the publication here

### GEO Link to raw data 
GSE250311\
Link: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE250311

### Software Requirements
FastQC (v0.11.9)\
STAR aligner (v2.7.10b)\
Integrative Genomics Viewer (2.16.1)\
HTSeq-count (v2.0.2)\
Salmon (0.13.1)\
MultiQC (v1.15)\
R Programming language (4.2.2)\
Cytoscape (3.9.1)\
ChEA3 (3.0)

### Scripts
```

Data Processing
		01_star.sh
		02_index_bam.sh
		03_sort_bam.sh
                04_filterBam.sh
                05_count_htseq.sh
                06_split_ercc.sh

Data Analysis 
  DGE
         R Script- DEG, GO, and etc
	 TFEA
	 PPI
	 files
  
  HC	 
         R Script- DEG, GO, and etc
	 TFEA
	 PPI
	 files
  
  Linc
         R Script- DEG, GO, and etc
	 TFEA
	 PPI
	 files
 ERCC
         R Script
         Files- excel

  ```  
    
### Result files
excel sheets of all genes, GO term, PPI, TF\
mutliQC-html


