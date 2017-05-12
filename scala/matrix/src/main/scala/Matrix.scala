case class Matrix(raw: String) {
  val data = raw
    .split("\n")
    .map(row => row.split(" ").map(_.toInt).toVector)
    .toVector

  def rows = data
  def cols(idx: Int) = data.map(row => row(idx))

  override def equals(obj: scala.Any): Boolean =
    obj.isInstanceOf[Matrix] && obj.asInstanceOf[Matrix].data == this.data
}
