object GuessNumber {
  def guess(selectedNumber: Int, attempts: Int, input: () => Int, output: (String) => Unit) = {
    val plural = if (attempts == 1) "" else "s"
    val responses = List("Aim lower", s"You got it in ${attempts} attempt${plural}", "Aim higher")
    val guessMatch = math.signum(selectedNumber - input())
    output(responses(guessMatch + 1))

    guessMatch == 0
  }

  def play(selectedNumber: Int, input: () => Int, output: (String) => Unit) =
    Iterator.from(1).find { guess(selectedNumber, _, input, output) }
}
