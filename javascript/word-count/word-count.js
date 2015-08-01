var words = function(phrase) {
  return phrase.split(/\s/)
    .reduce(function(hist, word) {
      if (word.trim().length == 0) return hist

      hist[word] = hist[word] || 0
      hist[word] += 1
      return hist
    }, Object.create(null))
}
module.exports = words;
