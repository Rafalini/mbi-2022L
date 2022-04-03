commands:

1)

docker run --rm -v /home/rafalini/git/mbi-2022L/output:/tmp -w /tmp wkusmirek/pirs pirs simulate GCF_000270065.1_ASM27006v1_genomic.fna -l 100 -x 50 -m 400 -v 20 -e 1

2)

docker run --rm -it -v /home/rafalini/git/mbi-2022L/output:/tmp -w /tmp wkusmirek/dnaasm dnaasm -assembly -k 55 -single_edge_counter_threshold 5 -genome_length 1629119 -correct 1 -paired_reads_algorithm 1 -i1_1 ./Sim_100_400_1.fq -i1_2 ./Sim_100_400_2.fq -output_file_name ./out.fa

3)

docker run --rm -v /home/rafalini/git/mbi-2022L/output:/tmp -w /tmp wkusmirek/quast quast.py -R GCF_000270065.1_ASM27006v1_genomic.fna out.fa