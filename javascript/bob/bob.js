//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

var shouting = function(phrase) {
  return phrase.toUpperCase() == phrase &&
    phrase.toLowerCase() != phrase
}

var question = function(phrase) {
  return phrase.match(/\?$/)
}

var silence = function(phrase) {
  return phrase.trim().length == 0
}

Bob.prototype.hey = function(input) {
  if (silence(input)) {
    return 'Fine. Be that way!'
  }
  if (shouting(input)) {
    return 'Whoa, chill out!'
  }
  if (question(input)) {
    return 'Sure.'
  }
  return 'Whatever.'
};

module.exports = Bob;
