def guess(selection, attempts, input, output)        
  plural = if attempts == 1 then "" else "s" end
  responses = ["Aim lower", "You got it in #{attempts} attempt#{plural}", "Aim higher"]

  guess_match = (selection - input.call) <=> 0
  output.call(responses[guess_match + 1]) 
  
  guess_match == 0    
end

def play(selection, input, output)
  (1..).find { |attempts| guess(selection, attempts, input, output) } 
end
