#lang scheme/base
(#%require rackunit)
(#%require rackunit/text-ui)
(#%require "../src/factorial.ss")

(define test-check-factorial
  (test-suite
   "Testing factorials"
   (test-case
    "Canary"
    (check-true #t "Canary"))
   (test-case
    "Iterative"
    (check-equal? (iterative_factorial 0) 1 "Test for 0")
    (check-equal? (iterative_factorial 1) 1 "Test for 1")
    (check-equal? (iterative_factorial 2) 2 "Test for 2")
    (check-equal? (iterative_factorial 5) 120 "Test for 5")
    (check-equal? (iterative_factorial 10) 3628800 "Test for 10")
    (check-equal? (iterative_factorial 50)
                  30414093201713378043612608166064768844377641568960512000000000000
                  "Test for 50"))
   (test-case
    "Recursive"
    (check-equal? (recursive_factorial 0) 1 "Test for 0")
    (check-equal? (recursive_factorial 1) 1 "Test for 1")
    (check-equal? (recursive_factorial 2) 2 "Test for 2")
    (check-equal? (recursive_factorial 5) 120 "Test for 5")
    (check-equal? (recursive_factorial 10) 3628800 "Test for 10")
    (check-equal? (recursive_factorial 50)
                  30414093201713378043612608166064768844377641568960512000000000000
                  "Test for 50"))
   (test-case
    "Tail-Recursive"
    (check-equal? (tail_factorial 0) 1 "Test for 0")
    (check-equal? (tail_factorial 1) 1 "Test for 1")
    (check-equal? (tail_factorial 2) 2 "Test for 2")
    (check-equal? (tail_factorial 5) 120 "Test for 5")
    (check-equal? (tail_factorial 10) 3628800 "Test for 10")
    (check-equal? (tail_factorial 50)
                  30414093201713378043612608166064768844377641568960512000000000000
                  "Test for 50"))))

(run-tests test-check-factorial)