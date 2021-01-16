import kotlin.random.Random
import kotlin.math.floor

fun d6(count: Int): Sequence<Int> {
    return 1.rangeTo(count).map { Random.nextInt(1, 6) }.asSequence()
}

class DndCharacter {

    val strength: Int = ability()
    val dexterity: Int = ability()
    val constitution: Int = ability()
    val intelligence: Int = ability()
    val wisdom: Int = ability()
    val charisma: Int = ability()
    val hitpoints: Int = 10 + modifier(constitution)

    companion object {

        fun ability(): Int {
            return d6(4).sortedDescending().take(3).sum()
        }

        fun modifier(score: Int): Int {
            return floor( (score - 10) / 2.0 ).toInt()
        }
    }

}
