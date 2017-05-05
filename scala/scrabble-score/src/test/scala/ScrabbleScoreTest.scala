import org.scalatest.{Matchers, FunSuite}

class scrabble_score_test extends FunSuite with Matchers {
  test("score letter lowercase") {
    Scrabble.scoreLetter('a') should be (1)
  }

  test("score letter uppercase") {
    Scrabble.scoreLetter('A') should be (1)
  }

  test("score word") {
    Scrabble.scoreWord("at") should be (2)
  }

  test("score word with dupe letters") {
    Scrabble.scoreWord("street") should be (6)
  }

  test("score quirky word") {
    Scrabble.scoreWord("quirky") should be (22)
  }

  test("score capitalized word") {
    Scrabble.scoreWord("OXYPHENBUTAZONE") should be (41)
  }

  test("score mixed case word") {
    Scrabble.scoreWord("Oxyphenbutazone") should be (41)
  }
}

