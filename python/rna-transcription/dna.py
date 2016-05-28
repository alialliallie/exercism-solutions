NUCLEOTIDE = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
}

def to_rna(sequence):
    return ''.join([NUCLEOTIDE[n] for n in sequence])
