import GuessNumber.play

import scala.io.StdIn.readLine
import scala.util.Random

object Game extends App {
  println("I've selected a number, can you guess it?")

  play(Random.nextInt(100), () => readLine("Your Guess: ").toInt, println)
}
