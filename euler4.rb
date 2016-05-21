# Challenges from https://projecteuler.net/

# 4. Largest Palindrome. "A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers."

# overview: work backward from 999 * 999 to generate products of two 3-digit numbers; test each product for palindrome status.  return largest one found

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
