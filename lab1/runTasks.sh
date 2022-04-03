#!/bin/bash

docker pull wkusmirek/pirs
docker pull wkusmirek/dnaasm
docker pull wkusmirek/quast
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/270/065/GCF_000270065.1_ASM27006v1/GCF_000270065.1_ASM27006v1_genomic.fna.gz 
gzip -d GCF_000270065.1_ASM27006v1_genomic.fna.gz

mkdir -p output
TARGET_DIR=/home/rafalini/git/mbi-2022L/lab1/output
cp GCF_000270065.1_ASM27006v1_genomic.fna ./output/


docker run --rm -v $TARGET_DIR:/tmp -w /tmp wkusmirek/pirs pirs simulate GCF_000270065.1_ASM27006v1_genomic.fna -l 100 -x 50 -m 400 -v 20 -e 0.01

docker run --rm -it -v $TARGET_DIR:/tmp -w /tmp wkusmirek/dnaasm dnaasm -assembly -k 55 -genome_length 1609006 -insert_size_mean_inward 400 -insert_size_std_dev_inward 20 -single_edge_counter_threshold 5 -i1_1 ./Sim_100_400_1.fq -i1_2 ./Sim_100_400_2.fq -output_file_name ./out.fa

docker run --rm -v $TARGET_DIR:/tmp -w /tmp wkusmirek/quast quast.py -R GCF_000270065.1_ASM27006v1_genomic.fna out.fa

pip3 install Bio
python3 main.py ./output/out.fa