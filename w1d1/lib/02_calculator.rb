# computes addition of two numbers
def add(a, b)
  a + b
end

# computes subtractions between two numbers
def subtract(a, b)
  a - b
end

# computes the sum of an array
def sum(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end

def multiply(a, b)
  product = 1
  numbers.each {|number| product *= number}
  product
end

def power(base, exponent)
  base ** exponent
end

# returns the factorial of a number
def factorial(n)
  factorial = 1
  while n > 0
    factorial *= n
    n -= 1
  end
  factorial
end
