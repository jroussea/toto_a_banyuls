#!/bin/bash

function print_usage() {
  echo ""
  echo "Une aide qui ne sert à rien"
  echo ""
}

# Si pas d'argument, on affiche l'aide
# ------------------------------------
if [ "$1" == "" ] ; then
  print_usage
  exit 0
fi

# si arguments on commence le script

# on parse les arguments
while getopts ":f:t:w:y:e:a:r:c:" PARAM; do
   case "$PARAM" in
      f) fasta=$OPTARG;;
      t) tara=$OPTARG;;
      w) work=$OPTARG;;
      e) env=$OPTARG;;
      a) all=$OPTARG;;
      r) run=$OPTARG;;
      c) cpus=$OPTARG;;
      \?) print_usage; exit 1 ;;
      h) print_usage; exit 1 ;;
   esac
done

###########################
#### Conda environment ####
###########################

source activate $env

####################
#### Parameters ####
####################

#RunName=`date +'%m%d%Y_%H-%M-%S'`
RunName=`date +'%m%d%Y_%H%M%S'`".cpu"$cpus".r8"
DirName=$(dirname "$0")

# create folder
mkdir $work/$RunName
mkdir $work/$RunName/diamond
mkdir $work/$RunName/iterative_blastp
mkdir $work/$RunName/iterative_blastp/tmp

# path
path_database="$work/$RunName/diamond"
path_work="$work/$RunName"
path_iterative="$work/$RunName/iterative_blastp"
path_tmp="$work/$RunName/iterative_blastp/tmp"

# all sequence
cat $tara $fasta > $path_database/sequence_bases_and_tara.faa

################################
#### STEP 1: Diamond makedb ####
################################

# construction de deux banque de données (tara et all)
#      - tara.dmnd : contient uniquement les séquences fasta de TARA Océan
#      - all.dmnd : contient les séquences fasta de TARA + les séquences fasta de Toto

echo -e "\nSTART BUILD DATABASE\n"

diamond makedb --in $tara -d $path_database/tara -p $cpus

echo -e "\nEND BUILD DATABASE\n"

if [[ "$all" == "true" ]]
then

  echo -e "\nSTART BUILD DATABASE\n"

  diamond makedb --in $path_database/sequence_bases_and_tara.faa -d $path_database/all -p $cpus

  echo -e "\nEND BUILD DATABASE\n"

fi

###########################################
#### STEP 2: Diamond BLASTp all vs all ####
###########################################

if [[ "$all" == "true" ]]
then

  echo -e "\nSTART BLASTp ALL vs ALL\n"

  diamond blastp \
          -d $path_database/all.dmnd \
          -q $path_database/sequence_bases_and_tara.faa\
          -o $path_work/all_against_all.blastp \
          --sensitive \
          -p $cpus \
          -e 0.001 \
          --matrix BLOSUM62 \
         --outfmt 6 qseqid qlen qstart qend sseqid slen sstart send length pident ppos score evalue bitscore

  echo -e "\nEND BLASTp ALL vs ALL\n"

fi

####################################
#### STEP 3 : Interative BLASTp ####
####################################

seqkit seq $fasta -n > $path_work/sequence_base_and_found.txt

fasta_list=$fasta

echo $fasta_list

for (( i=1; i<=$run; i++ ))
do

  echo -e "\nRun $i START\n"

  diamond blastp \
          -d $path_database/tara.dmnd \
          -q $fasta_list \
          -o $path_iterative/blastp_$i \
          -p $cpus \
          -e 0.001 \
          --matrix BLOSUM62 \
          --outfmt 6 qseqid qlen qstart qend sseqid slen sstart send length pident ppos score evalue bitscore

  file="$path_iterative/blastp_$i"

  if [ -e "$file" ]; then

    cut -f 1,5 $path_iterative/blastp_$i | tr '\t' '\n' | sort | uniq > $path_tmp/blastp.lst

    python3 $DirName/bin/toto_search_homologs.py $path_tmp/blastp.lst $path_work/sequence_base_and_found.txt $path_tmp $i

    tmp_name="sequence_$i.txt"

    seqkit grep -f $path_tmp/$tmp_name $tara -o $path_tmp/fasta_$i.fasta

    fasta_list="$path_tmp/fasta_$i.fasta"

    #cp sequence_list.txt save
    cat $path_tmp/$tmp_name >> $path_work/sequence_base_and_found.txt
    cat $path_tmp/$tmp_name >> $path_work/sequence_found.txt
    cat $path_tmp/fasta_$i.fasta >>  $path_work/sequence_found.faa

    echo -e "\nRun $i END\n"
else

    #mv sequence_list.txt results/
    #seqkit grep -f $tmp/tara_id.txt data/protein_part_001.faa -o results/tara_sequence.fasta

    echo -e "\nBREAK\n"

    break;

fi

done

cat $fasta $path_work/sequence_found.faa > $path_work/sequence_base_and_found.faa