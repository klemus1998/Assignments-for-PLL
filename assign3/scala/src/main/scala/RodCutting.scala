object RodCutting {

  def recursiveRod(prices: Map[Int, Int], rodLength: Int): Int = {
    if (prices.isEmpty || rodLength == 0) {
      return 0
    }
    
    (1 to rodLength).map(cut => prices.getOrElse(cut, 0) + recursiveRod(prices, rodLength - cut)).max
  }

  def memoizedRod(prices: Map[Int, Int], rodLength: Int): Int = {
    def computeMaxPrices(maxPrices: Map[Int, Int], rodLength: Int): Map[Int, Int] = {
      if (maxPrices.contains(rodLength)) {
        return maxPrices
      }

      if (rodLength == 0 || prices.isEmpty) {
        return maxPrices + (rodLength -> 0)
      }

      (1 to rodLength).foldLeft(maxPrices) { (accumulatedMaxPrices, cut) =>
        val maxPricesComputed = computeMaxPrices(accumulatedMaxPrices, rodLength - cut)

        val maxPricesForPart = prices.getOrElse(cut, 0) + maxPricesComputed.getOrElse(rodLength - cut, 0)

        maxPricesComputed + (rodLength -> math.max(maxPricesForPart, maxPricesComputed.getOrElse(rodLength, 0)))
      }
    }

    computeMaxPrices(Map(), rodLength)(rodLength)
  }
}
