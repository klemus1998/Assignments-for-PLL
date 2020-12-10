require_relative '../lib/guess'
require 'test/unit'

class GuessTest < Test::Unit::TestCase  
  def test_correct_on_first_attempt
    received = ""
    input = lambda { 10 }
    output = lambda { |response| received = response }

    guess(10, 1, input, output)

    assert received == "You got it in 1 attempt"
  end

  def test_smaller_on_first_attempt
    received = ""
    input = lambda { 9 }
    output = lambda { |response| received = response }

    guess(10, 1, input, output)

    assert received == "Aim higher"
  end

  def test_larger_on_first_attempt
    received = ""
    input = lambda { 11 }
    output = lambda { |response| received = response }

    guess(10, 1, input, output)

    assert received == "Aim lower"
  end

  def test_correct_on_second_attempt
    received = ""
    input = lambda { 12 }
    output = lambda { |response| received = response }
    
    guess(12, 2, input, output)

    assert received == "You got it in 2 attempts"
  end
  
  def test_guess_returns_true_on_correct_attempt
    input = lambda { 12 }
    output = lambda { |response| }

    assert guess(12, 1, input, output)
  end

  def test_guess_returns_true_any_correct_attempt
    input = lambda { 12 }
    output = lambda { |response| }

    assert guess(12, 3, input, output)
  end

  def test_guess_returns_false_on_incorrect_attempt
    input = lambda { 1 }
    output = lambda { |response| }

    assert !guess(15, 4, input, output)
  end

  def test_play_correct_value_on_first_attempt
    received = ""
    input = lambda { 20 }
    output = lambda { |response| received = response }

    play(20, input, output)

    assert received == "You got it in 1 attempt"
  end

  def test_play_correct_value_on_second_attempt
    received = []
    inputs = [15, 20]
    input = lambda { inputs.shift() }
    output = lambda { |response| received.push(response) }

    play(20, input, output)

    assert received == ['Aim higher', 'You got it in 2 attempts']
  end  

  def test_play_higher_then_correct_value_on_second_attempt
    received = []
    inputs = [25, 15]
    input = lambda { inputs.shift() }
    output = lambda { |response| received.push(response) }

    play(15, input, output)

    assert received == ['Aim lower', 'You got it in 2 attempts']
  end  

  def test_play_higher_higher_then_correct_value_on_third_attempt
    received = []
    inputs = [25, 20, 15]
    input = lambda { inputs.shift() }
    output = lambda { |response| received.push(response) }

    play(15, input, output)

    assert received == ['Aim lower', 'Aim lower', 'You got it in 3 attempts']
  end  

  def test_play_lower_higher_then_correct_value_on_third_attempt
    received = []
    inputs = [5, 20, 15]
    input = lambda { inputs.shift() }
    output = lambda { |response| received.push(response) }

    play(15, input, output)
    
    assert received == ['Aim higher', 'Aim lower', 'You got it in 3 attempts']
  end  
end
