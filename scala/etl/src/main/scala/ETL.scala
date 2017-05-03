object ETL {
  def transform(scores: Map[Int, Seq[String]]): Map[String, Int] =
    scores.flatMap {case(score, words) => words.map(_.toLowerCase -> score)}
}
