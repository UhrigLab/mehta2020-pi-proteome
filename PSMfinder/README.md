# PSMfinder
**TL;DR: Finds posttranslationally modified peptides within a proteome, extracts a fixed up and downstream length from the proteome and analyzes proteins for a motifs using MoMo (Cheng et al., 2019), which needs a license for commercial use**

PSMfinder is a function that uses a list of peptides that were modified to look up aminoacid sequences of fixed length in a translatome. It converts the list into a list of unmodified peptides, creates a blast database, uses blastp to find the unmodified peptides, and then searches for each modification and extracts the aminoacid sequences of a fixed length around the modification. It then uses a list of unique aminoacid sequences to run MoMo, a software free for peptide motiv analysis (commercial use needs a license). The script has only two parts the __main__ which   is the entry point of the script, handling in and out, and the script PSMfinder itself.

## Inputs (all mandatory, no additional input allowed):
* vmod_peptides_file: Path to file that contains the modified peptides.
* vmod_spec_file: Tab separated file that contains modifications. First column describes the modification (e.g. S*, T*, Y*, ...). Second column describes what the modified amino acid would look like if it were not modified (e.g. S, T, Y, ...). Third column describes if the modification is of interest or not (1 if of interest 0 if not). This column makes it easier to get rid of unwanted modifications and allows for avoiding pre-processing the modified peptide file. Make sure that more complex modifications are described first, because the modifications are searched in order of their occurfence. For example if ABC denotes modification Z and AB denotes modification Y, and the peptide sequence is ABCMLNABOP, then if the modifications are written such that the first line is AB[tab]Y[tab]1 and the second line isABC[tab]Z[tab]1 then the resulting unmodified peptide would be YCMLNYOP which is wrong. It should be ZMLNYOP. But since AB is first recognized, it gets replaced. Thus the first line needs to be ABC[tab]Z[tab]1 and the second line AB[tab]Y[tab]1, because ABC is more complex than AB.
* vtranslatome_file: Path to file where translatome is saved in fasta format.
* vrange: Number of AA that should be displayed up and downstream of a modification
* voutput_file_name: Path to file that should be created with all the output.

## Outputs (none is handed over directly, only files):
* File at the path specified with voutput_file_name containing all the results in tsv format. Organization of the file: peptide id, modified peptide, unmodified peptide, position of modification, modification type, target sequence the peptide was found, position where peptide is modified, sequence of peptide centered (if possible) around the modification, extended sequence (using Xes to indicate where there was the border of the protein).
* File at the path specified with voutput_file_name but with the ending '.momo.txt' which represents the input file for MoMo (Cheng et al, 2019).
* Folder at the path that the script is run called momo_out containing the output files of MoMo
* Temporary files:
  * Blast database: (Temp_find_Pep.blastDB.phr, Temp_find_Pep.blastDB.pog, Temp_find_Pep.blastDB.psi, Temp_find_Pep.blastDB.pin, Temp_find_Pep.blastDB.psd, Temp_find_Pep.blastDB.psq)
  * TempPept.fa: File containing the peptides in fasta format using >TestPeptide1, >Testpeptide2, ... as headers.
  * TempPept.out: File containing the blastp output

## Call:
python PSMfinder.py [vmod_peptides_file] [vmod_spec_file] [vtranslatome_file] [vrange] [voutput_file_name]

## Author information:
June 2019 - June 2020, Pascal Schlapfer, Devang Mehta, R. Glen Uhrig
