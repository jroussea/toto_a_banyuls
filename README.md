Toto at Banyuls
___

## Présentation

toto_a_banyuls is an iterative BLAST (Basic Local Alignment Search Tool) pipeline. It consists of two main parts. 
- The first part (optional) consists of an alignment of all sequences against all sequences (Tara sequence and user sequence).
- The second part (mandatory) is an iterative BLASTp. An alignment with BLAST is performed for each new match obtained with the previous BLAST.

The tool used for BLAST is Diamond (v2.1.8). SeqKit2 (2.8.2) is also used. 

## Installation

Ce pipeline a été testé sur Linux (exécution local : Ubuntu 22.04, cluster : SLURM). Aucune version n'a été testé sur MacOS et sur Windows.

Pour utiliser ce pipeline, Conda (ou Mamba) doit être installé : 
- Installation with [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/)
- Installation with [Anacodna](https://docs.anaconda.com/anaconda/install/)
- Installation with [Miniforge](https://github.com/conda-forge/miniforge?tab=readme-ov-file) :heart:

> [!TIP]
> The use of a Conda environment ensures reproducibility of analyses and, more generally, compliance with the FAIR (Findable, Accessible, Interoperable, Reusable) principles. \
> It ensures that versions of tools, modules or packages are in the selected versions compatible with the pipeline.

For more information on the FAIR Principles : [https://en.wikipedia.org/wiki/Fair_data](https://en.wikipedia.org/wiki/Fair_data).

## Run - local

### Step 1 - Building the Conda environment

The Conda environment can be built from the YAML file `environment.yml`.

```bash
conda env create -f environment.yml
```

For more information on the YAML (or YML) format: [https://en.wikipedia.org/wiki/YAML](https://en.wikipedia.org/wiki/YAML)

For more information about Conda : [https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)

### Step 2 - Run pipeline

A script is available to run the pipeline locally: `scripts/local_toto_search_homologs.sh`.

```bash
cd scripts

bash local_toto_search_homologs.sh
```

> [!NOTE]
> You need to modify the various variables: \
> _SCRIPT_ \
> _FASTA_ \
> _TARA_ \
> _WORKDIR_ \
> _CONDAENV_

> [!TIP]
> The path to the Conda environment can be found using the command `conda env list`.

## Run - SLURM

[En développement]

## Références

If you use this pipeline, please cite the following articles: 
1. B. Buchfink, K. Reuter, et H.-G. Drost, « Sensitive protein alignments at tree-of-life scale using DIAMOND », Nat Methods, vol. 18, no 4, Art. no 4, avr. 2021, doi: [10.1038/s41592-021-01101-x](https://doi.org/10.1038/s41592-021-01101-x).
2. W. Shen, S. Le, Y. Li, et F. Hu, « SeqKit: A Cross-Platform and Ultrafast Toolkit for FASTA/Q File Manipulation », PLOS ONE, vol. 11, no 10, p. e0163962, oct. 2016, doi: [10.1371/journal.pone.0163962](https://doi.org/10.1371/journal.pone.0163962).
3. W. Shen, B. Sipos, et L. Zhao, « SeqKit2: A Swiss army knife for sequence and alignment processing », iMeta, vol. 3, no 3, p. e191, 2024, doi: [https://doi.org/10.1002/imt2.191](https://doi.org/10.1002/imt2.191). 

___

### **Authorship & Acknowledgments**

- Written by Jérémy Rousseau ([@jroussea](https://github.com/jroussea))