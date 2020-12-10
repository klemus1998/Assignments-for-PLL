require_relative '../lib/rod_cutting'
require 'test/unit'
require 'benchmark'

module TestRodCutting
  def rod_cutting(prices, rod_length)
  end

  def test_canary
    assert(true, 'canary')
  end

  def test_empty
    prices = {}
    assert_equal(0, rod_cutting(prices, 0))
  end

  def test_length_1
    prices = { 1 => 1 }
    assert_equal(1, rod_cutting(prices, 1))
  end

  def test_length_2
    prices = { 1 => 1, 2 => 4 }
    assert_equal(4, rod_cutting(prices, 2))
  end

  def test_without_length
    prices = { 1 => 2, 3 => 5 }
    assert_equal(4, rod_cutting(prices, 2))
  end

  def test_with_twice_price_for_1
    prices = { 1 => 6, 2 => 3 }
    assert_equal(12, rod_cutting(prices, 2))
  end

  def test_for_length_5
    prices = { 1 => 2, 2 => 7, 3 => 3, 4 => 2, 5 => 5 }
    assert_equal(16, rod_cutting(prices, 5))
  end
end

class TestRecursiveRod < Test::Unit::TestCase
  include TestRodCutting
  def rod_cutting(prices, rod_length)
    recursive_rod(prices, rod_length)
  end
end

class TestMemoizedRod < Test::Unit::TestCase
  include TestRodCutting
  def rod_cutting(prices, rod_length)
    memoized_rod(prices, rod_length)
  end

  def test_time_difference
    prices = { 1 => 2, 2 => 7, 3 => 3, 4 => 2, 5 => 5, 6 => 7, 7 => 10, 8 => 11, 9 => 11, 10 => 12, 11 => 14, 12 => 15,
      13 => 10, 14 => 14, 15 => 15, 16 => 20, 17 => 23, 18 => 20, 19 => 25, 20 => 35 }

    assert(Benchmark.realtime{ recursive_rod(prices, 16) } > Benchmark.realtime{ memoized_rod(prices, 16) } * 10)
  end
end