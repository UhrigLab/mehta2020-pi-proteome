# PSMFinder
`PSMFinder.py` is a script that takes a list of phosphopeptides generated from Perseus and MaxQuant as input, maps them against a proteome file and outputs a list of peptide sequences of a defined length centered at the phosphorylated site. Next, these files are reformatted and taken for motif enrichment using the MoMo tool from [Meme Suite](http://meme-suite.org/doc/download.html).

**Please Cite:**
Mehta D, Ghahremani M, Pérez-Fernández M, Tan M, Schläpfer P, Plaxton WC and Uhrig RG. (2020) Phosphate and phosphite differentially impact the proteome and phosphoproteome of Arabidopsis suspension cell cultures

## Prerequisites

* Python3
* [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE:BlastDocs&DOC_TYPE:Download "BLAST download page")
* [Meme 5.1.1](http://meme-suite.org/doc/download.html)

## Usage

**Run Command:**
````
python PSMFinder.py [Peptide List File] [List of Modifications] [Proteome Fasta file] [Number of flanking AAs] [Output File Name]
````

*Example Inputs:*

Peptide List Files:`Pi_NoPi_phosphopep.txt` & `Phi_NoPi_phosphopep.txt`

List of Modifications: `SearchedModifications.txt`

Proteome Fasta file: Download `Athaliana_447_Araport11.protein.fa` from [here](https://genome.jgi.doe.gov/portal/pages/dynamicOrganismDownload.jsf?organism=Athaliana#)


*Example Outputs:*

Mapped and aligned phosphopeptides:`Pi_NoPi_motif.txt` & `Phi_NoPhi_motif.txt`

Input for MoMo: `Pi_NoPi_motif.momo.txt` & `Phi_NoPhi_motif.momo.txt`

MoMo output: `pi_momo_out/` & `phi_momo_out`
*pi_nophos_alignedpep.txt & phi_nophos_alignedpep.txt*: Output files from `pepseqfinder.py`


*Example Command:*

````
python3 pepseqfinder.py Pi_NoPi.txt SearchedModifications.txt Athaliana_447_Araport11.protein.fa 6 pi_nopi_motif.txt
````

*MoMo command implemented in PSMFinder:*

````
momo motifx --width 13 --protein-database /Users/devangmehta/Dropbox/POST_DOC/SCRIPTS/Athaliana_447_Araport11.protein.fa --remove-unknowns F pi_nophos_pep_motifin.txt
````
