var compute = function(seqA, seqB) {
  if (seqA.length != seqB.length) {
    throw 'DNA strands must be of equal length.' 
  }

  var strandA = seqA.split('')
  var strandB = seqB.split('')

  return strandA.filter(function(nucleotide, i) {
    return nucleotide != strandB[i]
  }).length
}
module.exports = { compute: compute }
