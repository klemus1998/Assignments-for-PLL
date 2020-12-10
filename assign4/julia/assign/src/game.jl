include("guess.jl")

using .guessNumber

println("I've selected a number, can you guess it?")

input = () -> begin 
    print("Your Guess: ")
    parse(Int, chomp(readline()))
end

play(rand(0:100), input, println)