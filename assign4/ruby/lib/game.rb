require_relative '../lib/guess'

puts "I've selected a number, can you guess it?"

def get_input
  print "Your Guess: "
  gets.chomp.to_i
end

play(rand(0..100), lambda { || get_input}, method(:puts))
