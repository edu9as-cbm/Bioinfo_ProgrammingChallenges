# Assignment 2: Intensive integration using Web APIs

A recent paper (DOI: 10.1371/journal.pone.0108567) executes a meta-analysis of a few thousand published co-expressed gene sets from Arabidopsis.  They break these co-expression sets into ~20 sub-networks of <200 genes each, that they find consistently co-expressed with one another.  Assume that you want to take the next step in their analysis, and see if there is already information linking these predicted sub-sets into known regulatory networks.  One step in this analysis would be to determine if the co-expressed genes are known to bind to one another.

Using the co-expressed gene list from Table S2 of the supplementary data from their analysis:

- Use a combination of any or all of: dbFetch, Togo REST API, EBI’s PSICQUIC REST API, DDBJ KEGG REST, and/or the Gene Ontology
- Find all protein-protein interaction networks that involve members of that gene list 
- Determine which members of the gene list interact with each other.  

Here is where you can get the current status of all PSICQUIC services: 

http://www.ebi.ac.uk/Tools/webservices/psicquic/registry/registry?action=STATUS 

This page tells you the base URL for each database's REST API.  Read the documentation for how to construct a PSICQUIC REST URL (link is here: https://psicquic.github.io/PsicquicSpec_1_3_Rest.html). I suggest that you use the BAR database from UToronto (it will return matches using AGI Locus Codes).

## 1. Input files

- **ArabidopsisSubNetwork_GeneList.txt**: Table S2 of the supplementary data from the paper, parsed by Mark Wilkinson.

## 2. Tasks 

- Create an “InteractionNetwork” Object to contain the members of each network.
- Annotate it with any KEGG Pathways the interaction network members are part of both KEGG ID and Pathway Name.
- Annotate it with the GO Terms associated with the total of all genes in the network, only from the biological_process part of the GO Ontology (both GO:ID and GO Term Name).
- Create a report of which members of the gene list interact with one another, together with the KEGG/GO functional annotations of those interacting members.

## 3. Bonus scores

- +1% if you create a ‘uso-general’ annotation object that can hold any functional annotation.

## 4. Public files
- main.rb
- sample.json
- collaborators.txt

## 5. Private files
- all_networks.json
- ArabidopsisSubNetwork_GeneList.txt
- doc/
- interaction_networks.rb
- interpretation_of_the_results.txt
- new_report.txt
- sample.json

## 6. Requirements

This code requires Ruby rest-client:

```
gem install rest-client -v 1.8.0
```

## 7. Usage

For the analysis of **sample.json**, run:

```
ruby main.rb
```

For the generation of all networks from scratch, uncomment line 3 in **main.rb** (and comment line 6) and run:

```
ruby main.rb ArabidopsisSubNetwork_GeneList.txt
```
