import GuessNumber.{guess, play}
import org.scalatest.FunSuite
import scala.collection.mutable._

class GuessNumberTest extends FunSuite {
  test("guess is correct on first attempt") {
    var received = ""
    val input = () => 10
    val output = (response: String) => received = response

    guess(10, 1, input, output)

    assert("You got it in 1 attempt" == received)
  }

  test("guess is smaller on first attempt") {
    var received = ""
    val input = () => 9
    val output = (response: String) => received = response

    guess(10, 1, input, output)

    assert("Aim higher" == received)
  }

  test("guess is larger on first attempt") {
    var received = ""
    val input = () => 11
    val output = (response: String) => received = response

    guess(10, 1, input, output)

    assert("Aim lower" == received)
  }

  test("guess is correct on second attempt") {
    var received = ""
    val input = () => 12
    val output = (response: String) => received = response

    guess(12, 2, input, output)

    assert("You got it in 2 attempts" == received)
  }

  test("guess returns true on correct guess") {
    val input = () => 12
    val output = (response: String) => {}

    assert(guess(12, 1, input, output))
  }

  test("guess returns true on correct guess on any attempts") {
    val input = () => 15
    val output = (response: String) => {}

    assert(guess(15, 3, input, output))
  }

  test("guess returns false on incorrect guess") {
    val input = () => 1
    val output = (response: String) => {}

    assert(!guess(15, 4, input, output))
  }

  test("play correct value on first attempt") {
    var received = ""
    val input = () => 20
    val output = (response: String) => received = response

    play(20, input, output)

    assert("You got it in 1 attempt" == received)
  }

 
 test("play correct value on second attempt") {
   val inputs = ListBuffer(15, 20)
   val received = ListBuffer[String]()
   val input = () => inputs.remove(0)
   val output: (String) => Unit = (response: String) => received += response

   play(20, input, output)

   assert("Aim higher" == received.head)
   assert("You got it in 2 attempts" == received(1))
 }

 test("play higher and then correct on second attempt") {
   val inputs = ListBuffer(25, 15)
   var received = ListBuffer[String]()
   val input = () => inputs.remove(0)
   val output: (String) => Unit = (response: String) => received += response

   play(15, input, output)

   assert("Aim lower" == received.head)
   assert("You got it in 2 attempts" == received(1))
 }

 test("play higher, higher and then correct on second attempt") {
   val inputs = ListBuffer(25, 20, 15)
   var received = ListBuffer[String]()
   val input = () => inputs.remove(0)
   val output: (String) => Unit = (response: String) => received += response

   play(15, input, output)

   assert("Aim lower" == received.head)
   assert("Aim lower" == received(1))
   assert("You got it in 3 attempts" == received(2))
 }

 test("play lower, higher and then correct on second attempt") {
   val inputs = ListBuffer(5, 20, 15)
   var received = ListBuffer[String]()
   val input = () => inputs.remove(0)
   val output: (String) => Unit = (response: String) => received += response

   play(15, input, output)

   assert("Aim higher" == received.head)
   assert("Aim lower" == received(1))
   assert("You got it in 3 attempts" == received(2))
 }
} 