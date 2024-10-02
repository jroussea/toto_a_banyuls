#!/bin/bash

#SBATCH --job-name=totophd
#SBATCH --output=/shared/projects/darkdino/toto_a_banyuls/scripts/totophd_%j.out

#SBATCH --time=1:00:00

#SBATCH --partition=fast

#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4GB

#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeremy.rousseau@mnhn.fr

module load diamond/2.1.9 seqkit/2.1.0

cd /shared/projects/darkdino/toto_a_banyuls/tools

SCRIPT="/shared/projects/darkdino/toto_a_banyuls/tools/toto_search_homologs"
FASTA="/shared/projects/darkdino/toto_a_banyuls/analysis/sequences.fasta"
TARA="/shared/projects/darkdino/toto_a_banyuls/database/OMID_supegal40sp_metaT.aa"
WORKDIR="/shared/projects/darkdino/toto_a_banyuls/analysis/SEQUENCES"
GENE="SEQUENCES"

bash $SCRIPT/main.sh -f $FASTA -t $TARA -w $WORKDIR -g $GENE -r 8 -c 10
