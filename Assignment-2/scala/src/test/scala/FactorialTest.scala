import org.scalatest.FunSuite

trait FactorialTest extends FunSuite {
  def factorial(number: Int): BigInt

  test("canary") {
    assert(true)
  }
  test("test for 0") {
    assert(1 == factorial(0))
  }
  test("test for 1") {
    assert(1 == factorial(1))
  }
  test("test for 2") { //Feedback: test for 2 instead of test for 1
    assert(2 == factorial(2))
  }
  test("test for 5") {
    assert(120 == factorial(5))
  }
  test("test for 10") {
    assert(3628800 == factorial(10))
  }
  test("test for 20") {
    assert(BigInt("2432902008176640000") == factorial(20))
  }
  test("test for 50") {
    assert(BigInt("30414093201713378043612608166064768844377641568960512000000000000") == factorial(50))
  }


}

//Feedback: please indent the following properly
  class FactorialIterative extends FactorialTest {
    def factorial(number: Int) = Factorial.factorialIterative(number: Int);
  }

  class FactorialRecursive extends FactorialTest {
    def factorial(number: Int) = Factorial.factorialRecursive(number: Int);
  }

  class tailFactorial extends FactorialTest {
    def factorial(number: Int) = Factorial.factorialTailRecursive(number: Int);
  }
