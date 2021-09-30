# Test Case: Check if returning from a block inside a function returns from
# the method.
#
# Result: Yes it returns from the method
def find_minimum_greater_than(number)
  (1..100).each do |no|
    return no if no > number
  end
  puts 'It will never reach here'
end

puts find_minimum_greater_than(10)
