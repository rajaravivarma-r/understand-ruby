# frozen_string_literal: true

def return_array_using_break(input)
  [].tap do |errors|
    errors << input
    break
  end
end

def return_array_using_next(input)
  [].tap do |errors|
    errors << input
    next
  end
end

def break_and_return_something_outside_of_block(input)
  error_list = [].tap do |errors|
    errors << input
    break
  end
  error_list
end

def break_with_something(input)
  [].tap do |errors|
    errors << input
    break errors
  end
end

value_from_break = return_array_using_break('hi')
value_from_next = return_array_using_next('hi')
value_from_return_outside_block = break_and_return_something_outside_of_block(
  'hi'
)
value_from_break_return = break_with_something('hi')

puts(
  "return_array_using_break => #{value_from_break.class}: #{value_from_break}"
)
puts "return_array_using_next => #{value_from_next.class}: #{value_from_next}"
puts(
  'break but return outside of array => ' \
  "#{value_from_return_outside_block.class}: #{value_from_return_outside_block}"
)
puts(
  "break with something => #{value_from_break_return.class}: " \
  "#{value_from_break_return}"
)

##################################################
# return_array_using_break => NilClass:          #
# return_array_using_next => Array: ["hi"]       #
# break but return outside of array => NilClass: #
# break with something => Array: ["hi"]          #
##################################################
