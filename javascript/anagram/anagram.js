
var comparableWord = function(word) {
  return word.toLowerCase().split('').sort().join()
}

var anagram = function(word) {
  var letters = comparableWord(word)
  var normalized = word.toLowerCase()

  var isAnagram = function(testWord) {
    return testWord.toLowerCase() != normalized &&
      comparableWord(testWord) == letters;
  }

  var matches = function(wordlist) {
    if (!Array.isArray(wordlist)) {
      wordlist = Array.prototype.slice.call(arguments);
    }
    return wordlist.filter(isAnagram)
  }
  return { matches: matches }
}

module.exports = anagram
