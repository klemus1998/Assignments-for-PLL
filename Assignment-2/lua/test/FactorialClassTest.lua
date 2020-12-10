package.path = ";./src/?.lua" ..package.path
package.path = ";.test/?.lua" ..package.path

local luaunit = require('test/luaunit')
local FactorialClass = require('src/Factorial')

function testCanary()
  luaunit.assertTrue(true)
end
                         
function testIterative()
  luaunit.assertEquals(FactorialClass.iterative(0), 1)
  luaunit.assertEquals(FactorialClass.iterative(1), 1)
  luaunit.assertEquals(FactorialClass.iterative(5), 120)
  luaunit.assertEquals(FactorialClass.iterative(10),3628800)
  luaunit.assertEquals(FactorialClass.iterative(20),2432902008176640000)
  luaunit.assertEquals(FactorialClass.iterative(50),30414093201713378043612608166064768844377641568960512000000000000)
end  

function testRecursive()
  luaunit.assertEquals(FactorialClass.recursive(0), 1)
  luaunit.assertEquals(FactorialClass.recursive(1), 1)
  luaunit.assertEquals(FactorialClass.recursive(5), 120)
  luaunit.assertEquals(FactorialClass.recursive(10),3628800)
  luaunit.assertEquals(FactorialClass.recursive(20),2432902008176640000)
  luaunit.assertEquals(FactorialClass.recursive(50),30414093201713378043612608166064768844377641568960512000000000000)
end  

function testTail()
    luaunit.assertEquals(FactorialClass.tail(0), 1)
    luaunit.assertEquals(FactorialClass.tail(1), 1)
    luaunit.assertEquals(FactorialClass.tail(5), 120)
    luaunit.assertEquals(FactorialClass.tail(10),3628800)
    luaunit.assertEquals(FactorialClass.tail(20),2432902008176640000)
    luaunit.assertEquals(FactorialClass.tail(50),30414093201713378043612608166064768844377641568960512000000000000)
end  

os.exit(luaunit.LuaUnit.run())
