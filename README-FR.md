# Toto à Banyuls
___

## Présentation

toto_a_banyuls est un pipeline permettant de réaliser un BLAST (Basic Local Alignment Search Tool) de mannière itératif. Il ce décompose en deux partie principale. 
- La première parie (optionnelle) consiste en un alignement de toutes les séquences contre toutes les séquences (séquence de Tara et séquence de l'utilisateur).
- La deuxième partie (obligatoire) correspond au BLASTp itératif. Un alignment avec BLAST est réaliser pour chaque nouveau match obtenu avec le BLAST précédent.

L'outil utilisé pour réaliser le BLAST est Diamond (v2.1.8). SeqKit2 (2.8.2) est également utilisé. 

## Installation

This pipeline has been tested on Linux (local execution: Ubuntu 22.04, cluster: SLURM). No version has been tested on MacOS or Windows.

Afin d'utiliser ce pipeline Conda (ou Mamba) doit être installé : 
- Installation avec [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/)
- Installation avec [Anacodna](https://docs.anaconda.com/anaconda/install/)
- Installation avec [Miniforge](https://github.com/conda-forge/miniforge?tab=readme-ov-file) :heart:

> [!TIP]
> L'utilisation d'un environnement Conda assure la reproductibilité des analyses et, plus généralement, le respect des principes FAIR (Findable, Accessible, Interoperable, Reusable). \
> Il permet de s'assurer que les versions des outils, modules ou packages sont dans les versions choisi compatible avec le pipeline

Pour plus d'information concernant les principes FAIR : [https://en.wikipedia.org/wiki/Fair_data](https://en.wikipedia.org/wiki/Fair_data).

## Execution - local

### Étape 1 - Constuire l'environnement

L'environnement Conda peut être construit à partir du fichier YAML `environment.yml`.

```bash
conda env create -f environment.yml
```

Pour plus d'information sur le format YAML (ou YML): [https://en.wikipedia.org/wiki/YAML](https://en.wikipedia.org/wiki/YAML)

Pour plus d'information concernant Conda : [https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)

### Étape 2 - Exécution du pipeline

Un script est disponible pour l'exécution local du pipeline : `scripts/local_toto_search_homologs.sh`

```bash
cd scripts

bash local_toto_search_homologs.sh
```

> [!NOTE]
> Il faut modifier les différentes variables \
> - **_SCRIPT_** \
> - **_FASTA_** \
> - **_TARA_** \
> - **_WORKDIR_** \
> - **_CONDAENV_**

> [!TIP]
> Le chemin vers l'environement Conda peut être trouvé en utilisant la commande `conda env list`

## Execution - SLURM

[En développement]

## Références

Si vous utilisé ce pipeline, veuillez citer les articles : 
1. B. Buchfink, K. Reuter, et H.-G. Drost, « Sensitive protein alignments at tree-of-life scale using DIAMOND », Nat Methods, vol. 18, no 4, Art. no 4, avr. 2021, doi: [10.1038/s41592-021-01101-x](https://doi.org/10.1038/s41592-021-01101-x).
2. W. Shen, S. Le, Y. Li, et F. Hu, « SeqKit: A Cross-Platform and Ultrafast Toolkit for FASTA/Q File Manipulation », PLOS ONE, vol. 11, no 10, p. e0163962, oct. 2016, doi: [10.1371/journal.pone.0163962](https://doi.org/10.1371/journal.pone.0163962).
3. W. Shen, B. Sipos, et L. Zhao, « SeqKit2: A Swiss army knife for sequence and alignment processing », iMeta, vol. 3, no 3, p. e191, 2024, doi: [https://doi.org/10.1002/imt2.191](https://doi.org/10.1002/imt2.191). 

___

### **Auteur et Remerciments**

- Écrit par Jérémy Rousseau ([@jroussea](https://github.com/jroussea))