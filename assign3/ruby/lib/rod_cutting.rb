def recursive_rod(prices, rod_length)
  return 0 if prices.empty? || rod_length.zero?

  (1..rod_length).map { |cut| (prices.fetch(cut, 0) + recursive_rod(prices, rod_length - cut)) }.max
end

def memoized_rod(prices, rod_length)
  compute_max_prices = ->(max_prices, length) {
    return max_prices.merge({ length => 0 }) if prices.empty? || length.zero?

    return max_prices if max_prices[length]

    (1..length).reduce(max_prices) { |accumulated_max_prices, cut|
      (max_prices_computed = compute_max_prices.call(accumulated_max_prices, (length - cut))
      max_prices_for_part = prices.fetch(cut, 0) + max_prices_computed.fetch(length - cut, 0)

      max_prices_computed.merge({ length => [max_prices_for_part, max_prices_computed.fetch(length, 0)].max}))
    }
  }
  compute_max_prices.call({}, rod_length)[rod_length]
end
