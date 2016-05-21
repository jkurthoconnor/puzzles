# Challenges from https://projecteuler.net/

# 7. 10001st Prime. "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. What is the 10001st prime number?" 

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