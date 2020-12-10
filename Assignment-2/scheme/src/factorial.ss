#lang scheme/base
(require srfi/1)

(define (iterative_factorial number)
  (if (or (< number 1) (= number 1))
      1
      (begin
      (apply * (iota number 1)))))


(define (recursive_factorial number)
  (if (= number 0)
      1
     (* number ( recursive_factorial(- number 1)))))

(define (tail_factorial number)
  (let loop ((number number)
             (accumulator 1))
    (if (zero? number)
        accumulator
        (loop ((lambda(number)(- number 1)) number) (* number accumulator)))))

(provide (all-defined-out))