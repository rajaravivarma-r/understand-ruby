# Set a variable with the result and change the value of the variable
# based on whether an exception has raised or not
#
# Advantage: The scope of the variable is very clear and very easy to
# understand
# Disadvantage: Method length is long
def set_result_and_return_result
  parse_result = false
  begin
    yield
    parse_result = true
  rescue StandardError
    puts('Handling exception')
  end
  parse_result
end

def implicitly_return_result_directly_based_on_exception_or_not
  yield
  true
rescue StandardError
  puts('Handling exception')
  false
end

puts 'Successful condition: Return value from set_result_and_return_result: ' \
  "#{set_result_and_return_result { 'successful' }}"
puts 'Failure condition: Return value from set_result_and_return_result: ' \
  "#{set_result_and_return_result { raise StandardError, 'failure' }}"

return_val = implicitly_return_result_directly_based_on_exception_or_not do
  'successful'
end
puts 'Successful condition: Return value from '\
  'implicitly_return_result_directly_based_on_exception_or_not: ' \
  "#{return_val}"

return_val = implicitly_return_result_directly_based_on_exception_or_not do
  raise StandardError, 'failure'
end
puts 'Failure condition: Return value from ' \
  'implicitly_return_result_directly_based_on_exception_or_not: ' \
  "#{return_val}"
