import scala.annotation.tailrec

object Factorial {
  def factorialIterative (number: Int) = (1 to number).map(BigInt(_)).product

  def factorialRecursive(number: Int): BigInt = if(number == 0) 1 else number * factorialRecursive(number-1)

  @tailrec def factorialTailRecursive(number: Int, factorial: BigInt = 1): BigInt =
    if (number == 0) factorial else factorialTailRecursive(number - 1, number * factorial)
}
