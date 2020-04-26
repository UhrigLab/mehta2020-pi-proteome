# Phosphoproteomics and proteomics of Arabdidopsis cells re-fed phosphate and phosphite.
Scripts and datasets used in Mehta D, Ghahremani M, Pérez-Fernández M, Tan M, Schläpfer P, Plaxton WC and Uhrig RG. (2020) Phosphate and phosphite differentially impact the proteome and phosphoproteome of Arabidopsis suspension cell cultures

## pepseqfinder
`pepseqfinder.py` is a script that takes a list of phosphopeptides generated from Perseus and MaxQuant as input, maps them against a proteome file and outputs a list of peptide sequences of a defined length centered at the phosphorylated site.

**Usage:**

````
python pepseqfinder.py [Peptide List File] [List of Modifications] [Proteome Fasta file] [Number of flanking AAs] [Output File Name]
````

*Phos_NoPhos_phosphopep.txt & Phi_NoPhos_phosphopep.txt*: Input peptide list file

*SearchedModifications.txt*: Input list of modifications to search for in input peptides

*pi_nophos_alignedpep.txt & phi_nophos_alignedpep.txt*: Output files from `pepseqfinder.py`

**Command Used:**

````
python3 pepseqfinder.py Phos_NoPhos.txt SearchedModifications.txt Athaliana_447_Araport11.protein.fa 6 pi_nophos_pep13.txt
````


## Motif Analysis Files
Files used as input for Motif enrichment analysis using a standalone installation of [Momo (MEME Suite 5.1.1)](http://meme-suite.org/index.html). 

*pi_nophos_pep_motifin.txt & phi_nophos_pep_motifin.txt*: Input files for `momo`

**Command Used:**

````
momo motifx --width 13 --protein-database /Users/devangmehta/Dropbox/POST_DOC/SCRIPTS/Athaliana_447_Araport11.protein.fa --remove-unknowns F pi_nophos_pep_motifin.txt
````


## R Plotting Scripts

Scripts used to produce various graphs used in the manuscript. Data files used are provided. To reproduce, edit input file locations in the R scripts. 
