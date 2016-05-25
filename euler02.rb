# Challenges from https://projecteuler.net/

# 2. Find the sum of all the even-valued Fibonacci terms that do not exceed 4,000,000
# - Fibonacci sequence: each new term is the sum of the previous two terms (e.g. 1, 2, 3, 5, 8...).

# find Fibonacci terms below 4,000,000
max = 4000000
fib = [0, 1]
a = 0
b = 1
while a + b <= max
  c = a + b
  fib.push c
  a = b
  b = c
end
p fib
p "^^ Fibonacci numbers below #{max}"
# find even terms in set of Fib below 4,000,000
p even_fib = fib.select { |n| n.even?}
p "^^ even Fibonacci numbers below #{max}"
# find sum of even Fib below 4,000,000
p even_fib.inject { |sum, n| sum + n }
p " ^ sum of even Fibonacci numbers below #{max}"

# OR

# a = 1
# b = 2
# even_sum = 2
# puts "Here's the Fibonacci sequence below 4,000,000:"
# puts a
# puts b
# while true
#   c = a + b
#   break if c >= 4000000
#   puts c
#   (even_sum = even_sum + c) if c.even?
#   a = b
#   b = c
# end
# puts "And here's the sum of all the even-valued terms in the Fibonacci sequence below 4,000,000: #{even_sum}."
