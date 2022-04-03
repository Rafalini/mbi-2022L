import sys
from Bio import SeqIO
from Bio.SeqUtils import GC

fh= next(SeqIO.parse(sys.argv[1], "fasta"))
print(GC(fh.seq))
