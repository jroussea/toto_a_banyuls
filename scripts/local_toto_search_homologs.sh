#!/bin/bash

SCRIPT="/home/jrousseau/Documents/git_projects/toto_a_banyuls"
FASTA="/home/jrousseau/Documents/git_projects/toto_a_banyuls/test/sequences.fasta"
TARA="/home/jrousseau/Documents/git_projects/toto_a_banyuls/test/OMID_supegal40sp_metaT.100000.aa"
WORKDIR="/home/jrousseau/Documents/git_projects/toto_a_banyuls/analysis/TEST"
GENE="TEST"
CONDAENV="/home/jrousseau/miniforge3/envs/toto_a_banyuls"

bash $SCRIPT/main.sh -f $FASTA -t $TARA -w $WORKDIR -g $GENE -e $CONDAENV -r 8 -c 10bash $SCRIPT/main.sh -f $FASTA -t $TARA -w $WORKDIR -e $CONDAENV -r 8 -c 10