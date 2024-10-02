#!/bin/bash

SCRIPT="/home/jrousseau/Documents/git_projects/toto_a_banyuls/tools/toto_search_homologs"
FASTA="/home/jrousseau/Documents/git_projects/toto_a_banyuls/analysis/sequences.fasta"
TARA="/home/jrousseau/Documents/git_projects/toto_a_banyuls/database/OMID_supegal40sp_metaT.100000.aa"
WORKDIR="/home/jrousseau/Documents/git_projects/toto_a_banyuls/analysis/SEQUENCES"
GENE="SEQUENCES"
CONDAENV="/home/jrousseau/miniforge3/envs/toto_a_banyuls"

bash $SCRIPT/main.sh -f $FASTA -t $TARA -w $WORKDIR -g $GENE -e $CONDAENV -r 8 -c 10
