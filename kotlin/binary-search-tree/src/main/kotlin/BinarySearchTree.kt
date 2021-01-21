class BinarySearchTree<T : Comparable<T>> {

  data class Node<T>(val data: T, val left: Node<T>? = null, val right: Node<T>? = null)

  var root: Node<T>? = null

  fun insert(value: T) {
    root = if (root == null)
       Node(value)
    else
       root.insert(value)
  }

  fun asSortedList(): List<T> {
    if (root == null) return listOf()

    val list = listOf<T>()
    return walkDepth(root!!, list)
  }

  fun asLevelOrderList(): List<T> {
    if (root == null) return listOf()

    return walkBreadth(listOf(root!!), listOf())
  }

  private fun Node<T>?.insert(value: T): Node<T> {
    return when {
      this == null  -> Node(value)
      value <= data -> Node(data, left = left.insert(value), right = right)
      else          -> Node(data, left = left, right = right.insert(value))
    }
  }

  private fun walkDepth(node: Node<T>?, acc: List<T>): List<T> {
    if (node == null) return acc

    val left = walkDepth(node.left, acc)
    val right = walkDepth(node.right, acc)

    return left + node.data + right
  }

  private tailrec fun walkBreadth(queue: List<Node<T>>, acc: List<T>): List<T> {
    if (queue.isEmpty()) return acc

    // Breadth first via recursively adding children to a queue
    // and the head's value to an accumulator list.
    val head = queue.first()
    val rest = queue.drop(1)
    val q = rest + head.left + head.right
    val a = acc + head.data
    return walkBreadth(q.filterNotNull(), a)
  }
}
