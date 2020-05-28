# Phosphoproteomics and proteomics of Arabdidopsis cells re-fed phosphate and phosphite.
Scripts and datasets used in Mehta D, Ghahremani M, Pérez-Fernández M, Tan M, Schläpfer P, Plaxton WC and Uhrig RG. (2020) Phosphate and phosphite differentially impact the proteome and phosphoproteome of Arabidopsis suspension cell cultures

## PSMFinder

`PSMFinder.py` is a script that takes a list of phosphopeptides generated from Perseus and MaxQuant as input, maps them against a proteome file and outputs a list of peptide sequences of a defined length centered at the phosphorylated site. It then reformats this output for motif enrichment analysis using the MoMo toot from [Meme suite](http://meme-suite.org/tools/momo).

For details on usage, refer to the Readme file in [`/PSMFinder`](https://github.com/UhrigLab/mehta2020-pi-proteome/tree/master/PSMfinder).

## R Plotting Scripts

Scripts used to produce various graphs used in the manuscript. Data files used are provided. To reproduce, edit input file locations in the R scripts. 
