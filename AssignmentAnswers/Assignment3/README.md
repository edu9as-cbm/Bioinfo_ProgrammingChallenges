# Assignment 3: GFF feature files and visualization

Your biologist collaborators are going to do a site-directed/insertional mutagenesis in Arabidopsis, using the list of 167 genes from your last assignment as the desired targets.  Inserts will be targeted to the repeat CTTCTT, and they want inserts to go into exons.

## 1. Input files

- [ArabidopsisSubNetwork_GeneList.txt](https://github.com/edu9as-cbm/Bioinfo_ProgrammingChallenges/tree/master/AssignmentAnswers/Assignment2)

## 2. Tasks

1. Using BioRuby, examine the sequences of the ~167 Arabidopsis genes from the last assignment by retrieving them from whatever database you wish.

2. Loop over every exon feature, and scan it for the CTTCTT sequence.

3. Take the coordinates of every CTTCTT sequence and create a new Sequence Feature (you can name the feature type, and source type, whatever you wish; the start and end coordinates are the first 'C' and the last 'T' of the match.).  Add that new Feature to the EnsEMBL Sequence object.

4.  Once you have found them all, and added them all, loop over each one of your CTTCTT features (using the ```features``` method of the EnsEMBL Sequence object) and create a GFF3-formatted file of these features.

5. Output a report showing which (if any) genes on your list do not have exons with the CTTCTT repeat.

6. Re-execute your GFF file creation so that the CTTCTT regions are now in the full chromosome coordinates used by EnsEMBL.  Save this as a separate file - I will grade you on both 4a and 5 so be sure to submit both! You have to calculate the chromosome coordinates yourself, somehow… hint - look in the information at the beginning of the sequence file. Note that this requires you to change column 1 of the GFF file also, not just the start and end coordinates.

7. Prove that your GFF file is correct by uploading it to ENSEMBL and adding it as a new “track” to the genome browser of Arabidopsis (see http://plants.ensembl.org/info/website/upload/index.html  - there are also links here that will help you understand GFF format → tells you what information should appear in Column 1!)    

Along with your code, for this assignment please submit a screen-shot of your GFF track beside the AT2G46340 gene on the ENSEMBL website to show me that you were successful.

## 3. Public files

- main.rb
- Arabidopsis_thaliana_219022154_19027528.png

## 4. Private files

- all_hits_in_chromosome_coordinates.gff
- all_hits_in_gene_coordinates.gff
- ArabidopsisSubNetwork_GeneList.txt
- bioruby-functions.rb
- doc/
- report_genes_without_cttctt_in_exons.txt

## 5. Requirements

This code needs rest-client and Bioruby to be installed:

```
gem install rest-client -v 1.8.0
gem install bio
```

## 6. Usage

```
ruby main.rb ArabidopsisSubNetwork_GeneList.txt
```