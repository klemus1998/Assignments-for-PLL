using Test

include("../src/guess.jl")

using .guessNumber

@testset "guess" begin
    @testset "guess correct on first attempt" begin
        received = ""
        input = () -> 10
        output = (response) -> received = response        
        
        guess(10, 1, input, output)      
        
        @test received == "You got it in 1 attempt"
    end

    @testset "guess smaller on first attempt" begin
        received = ""
        input = () -> 9
        output = (response) -> received = response        
    
        guess(10, 1, input, output)      
    
        @test received == "Aim higher"
    end

    @testset "guess larger on first attempt" begin
        received = ""
        input = () -> 11
        output = (response) -> received = response        

        guess(10, 1, input, output)      

        @test received == "Aim lower"
    end

    @testset "guess correct on second attempt" begin
        received = ""
        input = () -> 12
        output = (response) -> received = response        

        guess(12, 2, input, output)      

        @test received == "You got it in 2 attempts"
    end

    @testset "guess returns true on correct attempt" begin        
        input = () -> 12
        output = (response) -> nothing

        @test guess(12, 1, input, output) == true        
    end

    @testset "guess returns true on any correct attempt" begin
        input = () -> 12
        output = (response) -> nothing

        @test guess(12, 3, input, output) == true  
    end

    @testset "guess returns false on any incorrect attempt" begin
        input = () -> 1
        output = (response) -> nothing

        @test guess(15, 4, input, output) == false
    end 
end

@testset "play" begin
    @testset "play correct value on first attempt" begin    
        received = ""
        input = () -> 20
        output = (response) -> received = response

        play(20, input, output)

        @test received == "You got it in 1 attempt"
    end

    @testset "play correct value on second attempt" begin
        received = []
        inputs = [15, 20]
        input = () -> popat!(inputs, 1)
        output = (response) -> push!(received, response)

        play(20, input, output)

        @test received == ["Aim higher", "You got it in 2 attempts"]
    end

    @testset "play higher then correct value on second attempt" begin
        received = []
        inputs = [25, 15]
        input = () -> popat!(inputs, 1)
        output = (response) -> push!(received, response)

        play(15, input, output)

        @test received == ["Aim lower", "You got it in 2 attempts"]
    end

    @testset "play higher, higher then correct value on third attempt" begin
        received = []
        inputs = [25, 20, 15]
        input = () -> popat!(inputs, 1)
        output = (response) -> push!(received, response)

        play(15, input, output)

        @test received == ["Aim lower", "Aim lower", "You got it in 3 attempts"]
    end

    @testset "play lower, higher then correct value on third attempt" begin
        received = []
        inputs = [5, 20, 15]
        input = () -> popat!(inputs, 1)
        output = (response) -> push!(received, response)

        play(15, input, output)

        @test received == ["Aim higher", "Aim lower", "You got it in 3 attempts"]
    end
end