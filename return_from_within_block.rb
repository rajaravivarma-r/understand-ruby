def find_minimum_greater_than(number)
  (1..100).each do |no|
    return no if no > number
  end
  puts 'It will never reach here'
end

puts find_minimum_greater_than(10)
