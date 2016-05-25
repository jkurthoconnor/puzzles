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

#5 Smallest Multiple.  
"2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?" 
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



### 6 Sum Square Difference. 

"The sum of the squares of the first ten natural numbers is 1**2 + 2**2 + ... + 10**2 = 385

The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)** 2 = 55**2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum."

```ruby
# overview:
  # identify code to calculate sum of the squares of the first n natural numbers & store value in variable `sum_squares`
  # identify code to calculate the square of the sum of the first n natural numbers and store value in variable `square_sums`
  # 'diff = square_sums_n - sum_squares_n`

limit = 100
sum_squares = 0
(1..limit).each do |num|
  sum_squares += num**2
end
puts "The sum of the squares of the first #{limit} natural numbers is #{sum_squares}."
square_sums = (1..limit).inject { |sum, num| sum + num }**2
puts "The square of the sums of the first #{limit} natural numbers is #{square_sums}."
difference = square_sums - sum_squares
puts "The difference between the sum of the squares and the square of the sums of the first #{limit} natural numbers is #{difference}."
  
```


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

```ruby
## overview:
  ## test algorithm 
    ## loop to progress through `number` 
    ## at each iteration, calculate the products of digit and 3 subsequent digits
    ## save to variable the 4 digits sequence if they have the current highest product
    ## save to variable the 4 sequential digits that produced the current highest product
number = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

digits = number.to_s.split('')
ind = 0
greatest_product = 0
producers_of_gp = '' 
sequence_length = 13

while ind < digits.length
  n = 1
  product = digits[ind].to_i
  while n < sequence_length
    product = product * digits[ind + n].to_i 
    n += 1
  end
  
  if product > greatest_product
    greatest_product = product
    producers_of_gp = digits[ind...ind + sequence_length]
  end
  ind += 1
end

puts "The greatest product of #{sequence_length} adjacent digits is #{greatest_product}" # => 23514624000
puts "This product is produced by the adjacent digits: #{producers_of_gp}."

```

#9 Special Pythagorean Triplet. "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a**2 + b**2 = c**2 . For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc."



#10 Summation of Primes. "The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million."
