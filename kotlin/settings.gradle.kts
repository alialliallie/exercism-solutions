rootProject.name = "exercism"

fun isGradle(f: File): Boolean {
  return File(f, "build.gradle.kts").exists()
}

val files = file(".").listFiles().sorted()
files.filter(File::isDirectory).filter{isGradle(it)}.forEach { dir ->
  include(dir.name)
}
