# Challenges from https://projecteuler.net/

# 6. Sum Square Difference. 

# "The sum of the squares of the first ten natural numbers is 1**2 + 2**2 + ... + 10**2 = 385
# 
# The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)** 2 = 55**2 = 3025
# 
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum."


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
  

