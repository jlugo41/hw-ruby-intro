# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  
  #loop through the array and add each element to the total sum
  for x in arr
    sum += x
  end
  
  return sum
end

def max_2_sum arr
  sum = 0
  arraySize = arr.size
  
  # if the array is larger than 2 elements, sort it,
  # take the last two elements which will be the largest numbers, 
  # and add them together
  if (arraySize > 1)
    arr.sort!
    first = arr[arraySize-1]
    second = arr[arraySize-2]
    sum = first + second
  #if the array is only 1 element, return that element
  elsif (arraySize > 0)
    sum = arr[0]
  # if the array is empty, return 0
  else
    return 0
  end
  
end

def sum_to_n? arr, n
  arraySize = arr.size
  
  # if the array doesn't have at least 2 integers to add, return false
  if(arraySize == 0 || arraySize == 1)
    return false
  end
  
  # for use in keeping track of position in array
  nextPlace = 0
  
  # for each element in the array, individually add this element to each
  # element in the array and if the two sum up to n, return true
  arr.each do |x|
    nextPlace += 1
    # if the element in the array is n or we reached the end of the array,
    # return false
    if (x == n || nextPlace == arraySize)
      return false
    end
    
    arr.drop(nextPlace).each do |y|
      sum = x + y
      if (sum == n)
        return true
      end
      
    end
  end
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  if (s.size == 0)
    return false
  end
  
  letter = s[0]
  
  # if the first character in the string is not a letter, return false
  if (!letter.match?(/[a-zA-Z]/))
    return false
  end
  
  # if the first letter is a vowel, regardless of case, return false
  if (letter.casecmp?("a") || letter.casecmp?("e") || letter.casecmp?("i") || letter.casecmp?("o") || letter.casecmp?("u"))
    return false
  end
  
  #else return true
  return true
end

def binary_multiple_of_4? s
  # if the string only has 0s and 1s, convert to an integer and
  # if the number is divisible by 4, return true
  if (s.match?(/\A[0-1]+\z/))
    binaryNum = s.to_i(2)
  
    if (binaryNum % 4 == 0)
      return true
    else
      return false
    end
  # if the string has characters other than 0s or 1s, return false
  else
    return false
  end
  
end

# Part 3

class BookInStock
  # constructor
  def initialize(isbn, price)
    if(isbn.empty? == true)
      raise ArgumentError.new('There is no ISBN number!')
    end
    
    if(price <= 0)
      raise ArgumentError.new('The price is invalid!')
    end
    
    @isbn = isbn
    @price = price
  end
  
  # getters
  def isbn
    @isbn
  end
  
  def price
    @price
  end
  
  # setters
  def isbn=(isbn)
    @isbn = isbn
  end
  
  def price=(price)
    @price = price
  end
  
  
  def price_as_string
    # first round the price to 2 decimal points in case it's larger
    pr = @price.round(2)
    # now return string in correct format
    return "$%.2f" % pr
  end
  
end
