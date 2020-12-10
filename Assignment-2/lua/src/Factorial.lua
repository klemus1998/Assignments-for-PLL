package.path = ";./src/?.lua" ..package.path

local fun = require('src/fun')
local module = require('src/range')

local FactorialClass = {}

function FactorialClass.iterative (number)
    if number  <= 1 then return 1
    else
        return fun.product(module.range(1,number))
    end
end

function FactorialClass.recursive (number)
    if (number == 0 ) then return 1
    else
        return number * FactorialClass.recursive(number - 1)
    end
end

function FactorialClass.tail(number, factorial)
    factorial = factorial or 1
    if (number == 0) then return factorial
    else
        return FactorialClass.tail(number -1, number * factorial)
    end
end

return FactorialClass