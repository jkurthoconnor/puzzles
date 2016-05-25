# Challenges from https://projecteuler.net/

# 3. Largest prime factor. "the prime factors of 13195 are 5, 7, 13, 29.  What's the largest prime factor of 1,000?"

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