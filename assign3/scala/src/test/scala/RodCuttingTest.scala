import org.scalatest.FunSuite


trait RodCuttingTest extends FunSuite {
  def rodCutting(prices: Map[Int, Int], rodLength: Int): Int

  test("canary") {
    assert(true)
  }

  test("Test for empty price list") {
    val prices: Map[Int, Int] = Map()

    assert(0 == rodCutting(prices, 1))
  }

  test("Test for length 1 that is present in the price list") {
    val prices = Map(1 -> 2)

    assert(2 == rodCutting(prices, 1))
  }

  test("Test for length 2 where prices for length 1 and 2 are present in the price list") {
    val prices = Map(1 -> 2, 2 -> 6)

    assert(6 == rodCutting(prices, 2))
  }

  test("Test for length 2 where the price list has only price for length 1 and length 3") {
    val prices = Map(1 -> 2, 3 -> 5)

    assert(4 == rodCutting(prices, 2))
  }

  test("Test for length 2 where the price list has prices for length 1 and 2, but twice price for length 1 > price for length 2") {
    val prices = Map(1 -> 6, 2 -> 3)

    assert(12 == rodCutting(prices, 2))
  }

  test("Test for length 5 where the price list has prices for lengths 1 to 5, but total of price for length 1, length 2, length 2 > price for length 5") {
    val prices = Map(1 -> 2, 2 -> 7, 3 -> 3, 4 -> 2, 5 -> 5)

    assert(16 == rodCutting(prices, 5))
  }
}

class RecursiveRodTest extends RodCuttingTest {
  def rodCutting(prices: Map[Int, Int], rodLength: Int):Int = RodCutting.recursiveRod(prices, rodLength)
}

class MemoizedRodTest extends RodCuttingTest {
  def rodCutting(prices: Map[Int, Int], rodLength: Int): Int = RodCutting.memoizedRod(prices, rodLength)

  test("Test time difference between functions") {
    def executionTime(rodFunction: (Map[Int, Int], Int) => Int): Double = {
      val prices: Map[Int, Int] = Map(1 -> 2, 2 -> 7, 3 -> 3, 4 -> 2, 5 -> 5, 6 -> 7, 7 -> 10, 8 -> 11, 9 -> 11, 10 -> 12, 11 -> 14, 12 -> 15, 13 -> 10, 14 -> 14, 15 -> 15, 16 -> 20, 17 -> 23, 18 -> 20, 19 -> 25, 20 -> 35)

      val startTime = System.nanoTime

      rodFunction(prices, 16)

      (System.nanoTime - startTime) / 1e9d
    }

    assert(executionTime(RodCutting.recursiveRod) > executionTime(RodCutting.memoizedRod) * 10)
  }
}
