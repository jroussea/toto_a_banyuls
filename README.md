# Run locally

This pipeline has been tested on Linux (Ubuntu 22.04). No version has been tested on MacOS or Windows.

To use this pipeleine, you need to install conda. 
- Installation with [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/)
- Installation with [Anacodna](https://docs.anaconda.com/anaconda/install/)
- Installation with [Miniforge](https://github.com/conda-forge/miniforge?tab=readme-ov-file) [My favorite]

## Step 1 - Create and activate a conda environment

To run this pipeline, you need to create a conda environment. We use the `environment.yml` file, which contains all the different tools (Seqkit, Diamond) and languages (Python) used by the pipeline.

> **_NOTE:_** \
> The use of a Conda environment ensures the reproducibility of bioinformatics analyses. Sharing a YAML file ensures that the tools installed are in the correct version.

```bash
conda env create -f environment.yml
```

When the conda environment is created, it must be activated.

```bash
conda activate genotech
```

For more information on the YAML (or YML) format: [https://en.wikipedia.org/wiki/YAML](https://en.wikipedia.org/wiki/YAML)

For more information about Conda: [https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)

## Step 2 - Create the Diamond database (optional)

To use Diamond BLASTp, it is necessary to build a database containing the sequences used for alignment (for example: [non-redundant protein sequences (nr)](https://www.ncbi.nlm.nih.gov/refseq/about/nonredundantproteins/) of NCBI)

```bash 
diamond makedb --in data/tara -d data/tara -p 5
```

> [!IMPORTANT]  
> `--in`: Path to the input protein reference database file in FASTA format \
> `-d`: Path to the output DIAMOND database file. \
> `-p`: Number of CPU threads.

Pour plus d'information consulter la [documentation](https://github.com/bbuchfink/diamond/wiki/3.-Command-line-options).

## Étape 3 - BLASTp (alignement des séquences)

You're now ready to run Diamond BLASTp with this pipeline.

> [!NOTE] 
> This pipeline runs Diamond BLASTp X times for each new sequence obtained after each iteration.

```bash
./bash toto_search_homologs.sh -r 8 -f fasta_sequence -c 8
```

> [!IMPORTANT]  
> `-r`: Number of diamond BLASTp iterations \
> `-f`: File with FASTA sequences \
> `-c`: Number of CPU threads.

## Output description

- `tmp`: contains working environments with temporary files. Working environment names are of the form `year-month-day_hour-minute-second`.
- `results`: dossier contenant les résulats
    - `sequence_list.txt`: list of all sequences
    - `diamond_alignment.tsv`: Tabulation-Separated Values (TSV) file containing all alignments obtained with Diamond BLASTp (result of all iterations)
    - `tara_sequence.fasta`: FASTA file containing the sequences obtained with the database scan

# Exécuter avec SLURM

Pour avoir plus d'information, consulter la partie [Run locally](#run-locally)

## Step 1 - Create a conda environment (optional)

```bash
module load conda

conda env create -f environment.yml
```

## Step 2 - Run script

```bash
sbatch slurm_toto_search_homologs.sh
```

### **Auteur**

- Écrit par Jérémy Rousseau ([@jroussea](https://github.com/jroussea))