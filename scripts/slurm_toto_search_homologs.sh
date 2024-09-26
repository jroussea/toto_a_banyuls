#!/bin/bash

#SBATCH --job-name=TOTOXXXX
#SBATCH --output=/shared/projects/darkdino/TOTOXXXX_%j.out

#SBATCH --time=24:00:00

#SBATCH --partition=fast

#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=16GB

module load conda

source activate /shared/projects/darkdino/conda/envs

cd /shared/projects/darkdino

run=8
fasta="test/list_sequence.fasta"
cpus=8

./toto_search_homologs.sh -r $run -f $fasta -c 8