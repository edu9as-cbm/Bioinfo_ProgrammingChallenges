# Assignment 4: Searching Orthologues

**Orthologous genes** are those which are found in different species that evolved from a common ancestral gene by **speciation**.

A common first-step in discovery of orthologues is to do a **reciprocal best BLAST**:
- You take protein X in Species A, and BLAST it against all proteins in Species B.  
- The top significant hit in Species B is then BLASTed against all proteins in Species A.
- If its top significant hit is the Protein X, then those two proteins are considered to be orthologue candidates; there is more work to do after this, but this is a good start.

## 1. Input files

- **arabidopsis.fa**: *Arabidopsis thaliana* proteome in FASTA format.
- **pep.fa**: *Saccharomyces pombe* proteome in FASTA format.

## 2. Tasks

Using BioRuby to blast and parse the BLAST reports, find the ortholog pairs between species *Arabidopsis thaliana* and *Saccharomyces pombe*.

To decide on sensible BLAST parameters, do a bit of online reading - when you have decided what parameters to use, please cite the paper or website that provided the information.

## 3. Output files

- orthologues_candidates.txt

The first 10 lines of this file are:

```
A_thaliana	S_pombe
AT1G50920.1	SPBC651.01c
AT1G50940.1	SPAC27D7.06
AT1G15000.1	SPBC16G5.09
AT1G77300.1	SPAC29B12.02c
AT1G22840.1	SPCC191.07
AT1G12640.1	SPBC16A3.10
AT1G09770.1	SPAC644.12
AT1G75200.1	SPCC1020.08
AT1G09760.1	SPBC1861.08c
```

## 4. Bonus scores

Reciprocal-best-BLAST is only the first step in demonstrating that two genes are orthologous.  Write a few sentences describing how you would continue to analyze the putative orthologues you just discovered, to prove that they really are orthologues. You DO NOT need to write the code - just describe in words what that code would do.

## 5. Public files

None

## 6. Private files

- arabidopsis.fa
- main.rb
- orthologues_candidates.txt
- pep.fa

## 7. Requirements

This code requires Bioruby to be installed:

```
gem install bio
```

## 8. Usage

First, load the proteome databases (for both *Arabidopsis thaliana* and *Saccharomyces pombe*):

```
mkdir Databases
makeblastdb -in arabidopsis.fa -dbtype 'nucl' -out Databases/arabidopsis
makeblastdb -in pep.fa -dbtype 'prot' -out Databases/pep
```

And run the code:

```
ruby main.rb
```
