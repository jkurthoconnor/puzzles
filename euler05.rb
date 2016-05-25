# Challenges from https://projecteuler.net/

# 5 Smallest Multiple.  "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?" 
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