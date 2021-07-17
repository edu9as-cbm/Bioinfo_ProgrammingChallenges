# Assignment 1: Creating Objects

This assignment reflects one of the most common scenarios in bioinformatics: a series of files that are linked with each other based on (different) identifier numbers.

It also asks you to start thinking about "databases", and the fact that databases are dynamic and must be updated (in this case, the amount of seed left in your genebank)

Estimated time: 8-10 hours.

## 1. Input files

There are three tab-delimited data files:

1. **seed_stock_data.tsv**: contains information about seeds in your GeneBank.
2. **gene_information.tsv**: contains information about genes.
3. **cross_data.tsv**: contains information about the crosses you have made.

## 2. Tasks

The task is to use Object-oriented programming to achieve two things:

1. "Simulate" planting 7 grams of seeds from each of the records in the seed stock GeneBank.
    - You should update the GeneBank information to show the new quantity of seeds that remain after a planting. The new state of the GeneBank should be printed to a new file, using exactly the same format as the original file **seed_stock_data.tsv**. 
    - If the amount of seed is reduced to zero or less than zero, then a friendly warning message should appear on the screen. The amount of seed left in the gene bank is, of course, not less than zero.

2. Process the information in **cross_data.tsv** and determine which genes are
genetically-linked. To achieve this, you will have to do a Chi-square test
on the F2 cross data. If you discover genes that are linked, this information
should be added as a property of each of the genes (they are both linked to each
other).

## 3. Output

The output of your program should look like this:
```
$ ruby process_database.rb  gene_information.tsv  seed_stock_data.tsv  cross_data.tsv  new_stock_file.tsv

WARNING: we have run out of Seed Stock B22
WARNING: we have run out of Seed Stock A12
Recording: ckx-3 is genetically linked to apt with chisquare score 12.291048482

Final Report:

ckx-3 is linked to apt
ckx-1 is linked to ckx-3
```

Your program should also create the tab-delimited updated new_stock_file.tsv that contains:

| Seed_Stock | Mutant_Gene_ID | Last_Planted | Storage | Grams_Remaining |
| :-: | :-: | :-: | :-: | :-: |
| B22 | AT2G23100 | 8/2/2021 | cama16 | 0 |
| A5 | AT1G21345 | 8/2/2021 | cama25 | 5 |
| B17 | AT3G28132 | 8/2/2021 | cama18 | 15 |
| C9102 | AT1G50231 | 8/2/2021 | cama2 | 21 |
| A12 | AT1G41028 | 8/2/2021 | cama25 | 0 |

## 4. Bonus scores

- +1% if your Gene Object tests the format of the Gene Identifier and rejects incorrect formats without crashing. Arabidopsis gene identifiers have the format /A[Tt]\d[Gg]\d\d\d\d\d/
    - If the identifier isn't correct, then your code should stop with a helpful error message.

- +1% if you create an Object that represents your entire Seed Stock "database":
    - The object should have a ```load_from_file("seed_stock_data.tsv")```.
    - The object should access individual SeedStock objects based on their ID (e.g., ```StockDatabase.get_seed_stock('A17')```).
    - The object should have a ```write_database('new_stock_file.tsv')```.

## 5. Public files
- mainScript.rb

## 6. Private files
- seed_stock_data.tsv
- gene_information.tsv
- cross_data.tsv
- CrossObject.rb
- DatabaseObject.rb
- GeneObject.rb
- cross_data.tsv
