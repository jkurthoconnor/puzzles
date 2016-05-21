# Challenges from https://projecteuler.net/
# 1. find the sum of all the multiples of 3 or 5 below 1000

mults = [] 
n = 1
while n < 1000
  if n % 3 == 0 || n % 5 == 0
    mults.push n
  end
  n += 1
end
p mults.inject { |sum, n| sum + n }
    

# OR

# x = 1
# sum = 0
# while x < 1000
# 	if (x % 3 == 0) || (x % 5 == 0)
# 		print "#{x} "
# 		sum = sum + x
# 	end
# x = x + 1
# end
# puts
# puts "The sum of all the multiples of 3 or 5 below 1000 is #{sum}."
