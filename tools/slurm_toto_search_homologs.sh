#!/bin/bash

#SBATCH --job-name=totophd
#SBATCH --output=/shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/scripts/totophd_%j.out

#SBATCH --time=1:00:00

#SBATCH --partition=fast

#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4GB

module load conda

cd /shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/scripts

SCRIPT="/shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/tools/toto_search_homologs"
FASTA="/shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/test/sequences.fasta"
TARA="/shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/database/OMID_supegal40sp_metaT.aa"
WORKDIR="/shared/projects/darkdino/test_ue_lucie/toto_a_banyuls/analysis"
CONDAENV="/shared/projects/darkdino/conda/envs/toto_a_banyuls"

bash $SCRIPT/main.sh -f $FASTA -t $TARA -w $WORKDIR -e $CONDAENV -r 8 -c 10