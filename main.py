import sys
from Bio import SeqIO

filename=sys.argv[1]

fh= open(filename,'r')

parser = SeqIO.parse(fh, "fasta")

gc = 0
total = 0
for record in parser:
    for x in str(record.seq):
        if x == 'G' or x == 'C':
            gc +=1    
    total += len(record.seq)

gc_content = gc * 100 / total

print("GC: {}%".format(gc_content))
