# Toto à Banyuls
___

## Présentation

toto_a_banyuls est un pipeline permettant de réaliser un BLAST (Basic Local Alignment Search Tool) de mannière itératif. Il ce décompose en deux partie principale. 
- La première partie correspond au BLASTp itératif. Un alignment avec BLAST est réaliser pour chaque nouveau match obtenu avec le BLAST précédent.
- La deuxième parie consiste en un alignement de toutes les séquences (trouvé dans les base de données ainsi que les séquences initiale) contre elle même.

Ce pipeline utilise les outils Diamond (v2.1.8) pour réaliser le BLAST ainsi que Seqkit2 (v2.8.2).

```bash
toto_a_banyuls/
├── bin/  # Contient un script python utilisé pour chercher les homologues
│
├── analysis/  # dossier qui contiendra les résultats des anlyses
│
├── scripts/  # Dossier contenant les scripts permettant l'exécution du pipeline
│   ├── local_toto_search_homologs.sh  # Exécution du pipeline sur un ordinateur
│   └── slurm_toto_search_homologs.sh  # Exécution du pipeline sur un cluster de calcul SLURM
│
└── smileys/  # Smileys
```

## Installation

Ce pipeline a été testé sur Linux (Ubuntu 22.04) ainsi que sur une plateforme HPC (SLURM).

Afin d'utiliser ce pipeline Conda (ou Mamba) doit être installé : 
- Installation avec [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/)
- Installation avec [Anacodna](https://docs.anaconda.com/anaconda/install/)
- Installation avec [Miniforge](https://github.com/conda-forge/miniforge?tab=readme-ov-file) :heart:

> [!TIP]
> L'utilisation d'un environnement Conda assure la reproductibilité des analyses \
> Les outils ainsi installé sont toujour dans la version sélectionné par le développeur

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
> - **_SCRIPT_** : chemin vers le script main.sh \
> - **_FASTA_** : chemin vers le fichier FASTA \
> - **_TARA_** : chemin vers la banque de données \
> - **_WORKDIR_** : chemin vers le répertoire de travail (généralement l'endroit ou se situe le fichier FASTA) \
> - **_GENE_** : nom du répertoire de travail \
> - **_CONDAENV_** : chemin vers l'environement Conda

> [!TIP]
> Le chemin vers l'environement Conda peut être trouvé en utilisant la commande `conda env list`

## Execution - SLURM

Consulté les condition d'utilisation de Conda concernant le cluster que vous utilisé :
- ABiMS (Station Biologique de Roscoff) : [https://abims-sbr.gitlab.io/cluster/doc/software/module/#conda](https://abims-sbr.gitlab.io/cluster/doc/software/module/#conda)
- IFB-core (Institut Français de Bioinformatique) : [https://ifb-elixirfr.gitlab.io/cluster/doc/software/module/#conda](https://ifb-elixirfr.gitlab.io/cluster/doc/software/module/#conda)

```bash
cd scripts

sbatch slurm_toto_search_homologs.sh
```

Il est nécessaire de modifier les variable, cf : [Exécution local](#execution---local)

> [!TIP]
> Pour vérifier l'exécution du pipeline \
> `squeue -u $USER` \
> `cat *.log`

## Références

Si vous utilisé ce pipeline, veuillez citer les articles : 
1. B. Buchfink, K. Reuter, et H.-G. Drost, « Sensitive protein alignments at tree-of-life scale using DIAMOND », Nat Methods, vol. 18, no 4, Art. no 4, avr. 2021, doi: [10.1038/s41592-021-01101-x](https://doi.org/10.1038/s41592-021-01101-x).
2. W. Shen, S. Le, Y. Li, et F. Hu, « SeqKit: A Cross-Platform and Ultrafast Toolkit for FASTA/Q File Manipulation », PLOS ONE, vol. 11, no 10, p. e0163962, oct. 2016, doi: [10.1371/journal.pone.0163962](https://doi.org/10.1371/journal.pone.0163962).
3. W. Shen, B. Sipos, et L. Zhao, « SeqKit2: A Swiss army knife for sequence and alignment processing », iMeta, vol. 3, no 3, p. e191, 2024, doi: [https://doi.org/10.1002/imt2.191](https://doi.org/10.1002/imt2.191). 

___

### **Auteur.es et Remerciments**

- Écrit par Jérémy Rousseau ([@jroussea](https://github.com/jroussea))