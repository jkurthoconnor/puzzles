Challenges from https://projecteuler.net/

### 1. find the sum of all the multiples of 3 or 5 below 1000

```ruby
# find all specified multiples
mults = [] 
n = 1
while n < 1000
  if n % 3 == 0 || n % 5 == 0
    mults.push n
  end
  n += 1
end

# find sum of specified multiples
p mults.inject { |sum, n| sum + n }
    

# OR

x = 1
sum = 0
while x < 1000
	if (x % 3 == 0) || (x % 5 == 0)
		print "#{x} "
		sum = sum + x
	end
x = x + 1
end
puts
puts "The sum of all the multiples of 3 or 5 below 1000 is #{sum}."

```

### 2. Fibonacci sequence: each new term is the sum of the previous two terms (e.g. 1, 2, 3, 5, 8...). Find the sum of all the even-valued Fibonacci terms that do not exceed 4,000,000

```ruby
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

a = 1
b = 2
even_sum = 2
puts "Here's the Fibonacci sequence below 4,000,000:"
puts a
puts b
while true
  c = a + b
  break if c >= 4000000
  puts c
  (even_sum = even_sum + c) if c.even?     # or: if c % 2 == 0
  a = b
  b = c
end
puts "And here's the sum of all the even-valued terms in the Fibonacci sequence below 4,000,000: #{even_sum}."

```

### 3. Largest prime factor. "the prime factors of 13195 are 5, 7, 13, 29.  What's the largest prime factor of 1,000?"

```ruby
# find factors of n (OK to exclude n and 1 since goal is primes)
puts "Please enter a number for which you wish to find the largest prime factor."
number = gets.chomp.to_i
factors = []
prime_factors = []
(2...number).each do |fac|
  factors.push fac if number % fac == 0
end
# find prime factors of n; i.e. check each element in `factors` for prime status
factors.each do |fac|
  facs_factors = []
  (2...fac).each do |n|
    facs_factors.push n if fac % n == 0
  end
  prime_factors.push fac if facs_factors.length == 0
end
puts "The factors of #{number} are #{factors}."
puts "The prime factors of #{number} are #{prime_factors}."
# identify largest prime factor of n
puts "The largest prime factor of #{number} is #{prime_factors.max}"
```

### 4. Largest Palindrome. "A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers."

```ruby
#overview: work backward from 999 * 999 to generate products of two 3-digit numbers; test each product for palindrome status.  return largest one found

n1 = 999
palindromes = []
while n1 > 99
  n2 = 999
  while n2 > 99
    product = n1 * n2
    if product.to_s == product.to_s.reverse
      p product
      palindromes.push product
    end
    n2 -= 1
  end
  n1 -= 1
end
p palindromes.uniq 
puts "#{palindromes.max} is the largest palindromic number made from product of two 3-digit numbers."

```

#5 Smallest Multiple.  "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?" 
```ruby
# overview: 
  # test a number for divisibility by 1..20; 
    # break if at any point number isn't divisible
  # increment tested number by 1 after each iteration
  # stop and return 1st number that is divisible by 1..20

n = 20
range = (1..20)

loop do
  divisors = []
  range.each do |div|
    divisors.push div if n % div == 0
  end
  break if divisors == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ]
  n += 1
  p n if n % 10000 == 0 # to monitor progress
end
p n  # => 232792560
```






#6 Sum Square Difference. "The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385

The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum."

#7 10001st Prime. "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?" 104743

```ruby
# establish a counter for primes
# prime finding while loop that ends when prime counter hits 10001. 
# return the 10001st prime found

counter = 0
n = 2
while counter < 10001  
  divisors = []
  (1..n).each do |div|
    divisors.push div if n % div == 0
  end
  if divisors == [ 1, n ]
    counter += 1
    p n # final output: 104743
  end
  n += 1
end

```

#8 Largest Product in a Series. "The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?"

#9 Special Pythagorean Triplet. "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a2 + b2 = c2 . For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc."



#10 Summation of Primes. "The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million."
