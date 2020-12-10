module guessNumber

  using Base.Iterators
  using Lazy
  using IterTools

  export guess, play

  function guess(selection, attempts, input, output)
      plural = attempts > 1 ? "s" : ""
      responses = ["Aim lower", "You got it in $attempts attempt$plural", "Aim higher"]
      guess_match = sign(selection - input())
      output(responses[guess_match + 2])
      guess_match == 0
  end

  function play(selection, input, output)
      collect(IterTools.takewhile(attempt -> !guess(selection, attempt, input, output), Lazy.range(1)))
  end
end
