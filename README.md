# Toto à Banyuls
___

## Présentation

toto_a_banyuls est un pipeline permettant de réaliser un BLAST (Basic Local Alignment Search Tool) de mannière itératif. Il ce décompose en deux partie principale. 
- La première partie correspond au BLASTp itératif. Un alignment avec BLAST est réaliser pour chaque nouveau match obtenu avec le BLAST précédent.
- La deuxième parie consiste en un alignement de toutes les séquences (trouvé dans les base de données ainsi que les séquences initiale) contre elle même.

Ce pipeline utilise les outils Diamond (v2.1.8) pour réaliser le BLAST ainsi que Seqkit2 (v2.8.2).

```bash
toto_a_banyuls/
│
├── analysis/  # dossier qui contiendra les résultats des anlyses
│
├── database/ # dossier ou est stocké la base de donnée
│
├── tools/  # Dossier contenant les scripts permettant l'exécution du pipeline
│   ├── local_toto_search_homologs.sh  # Exécution du pipeline sur un ordinateur
│   ├── slurm_toto_search_homologs.sh  # Exécution du pipeline sur un cluster de calcul SLURM
│   └── toto_search_homologs/ # outils permettant de rechercher les homologues
│       ├── bin/  # Contient un script python utilisé pour chercher les homologues
│       └── main.sh # script principale permettant de rechercher les homologue
│           └── toto_search_homologs.py
│
├── test/
│   └── sequence.fasta # Fichier FASTA test
│
├── environment.yml # Fichier pour construire l'environement Conda
│
└── README.md # Le fichier que vous êtes en train de lire
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

### Étape 2 - Activer l'environement

Avant d'exécuter le pipeline, il est nécessaire d'activer l'environement Conda créé précédement afin de pouvoir utiliser les commandes.

```bash
conda activate toto_a_banyuls
``` 

### Étape 2 - Exécution du pipeline

Un script est disponible pour l'exécution local du pipeline : `scripts/local_toto_search_homologs.sh`

```bash
cd tools

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

Pour l'écution avec SLURM, les outils sont chargé avec la commande `module load <nom du module>`.

Les versions utilisé sont celle présente sur le cluster de calcul [ABiMS (Station Biologique de Roscoff)](https://abims.sb-roscoff.fr/). En fonction de votre système il peut être nécessaire de les modifier.

```bash
cd tools

sbatch slurm_toto_search_homologs.sh
```

Il est nécessaire de modifier les variable, cf : [Exécution local](#execution---local)

> [!TIP]
> Pour vérifier l'exécution du pipeline \
> `squeue -u $USER` \
> `cat *.log`

Pour plus d'information concernant l'utilisation d'un cluster de calcul utilisant SLURM vous pouvez consulter la [documentation](https://slurm.schedmd.com/documentation.html).

## Références

Si vous utilisé ce pipeline, veuillez citer les articles : 
1. B. Buchfink, K. Reuter, et H.-G. Drost, « Sensitive protein alignments at tree-of-life scale using DIAMOND », Nat Methods, vol. 18, no 4, Art. no 4, avr. 2021, doi: [10.1038/s41592-021-01101-x](https://doi.org/10.1038/s41592-021-01101-x).
2. W. Shen, S. Le, Y. Li, et F. Hu, « SeqKit: A Cross-Platform and Ultrafast Toolkit for FASTA/Q File Manipulation », PLOS ONE, vol. 11, no 10, p. e0163962, oct. 2016, doi: [10.1371/journal.pone.0163962](https://doi.org/10.1371/journal.pone.0163962).
3. W. Shen, B. Sipos, et L. Zhao, « SeqKit2: A Swiss army knife for sequence and alignment processing », iMeta, vol. 3, no 3, p. e191, 2024, doi: [https://doi.org/10.1002/imt2.191](https://doi.org/10.1002/imt2.191). 