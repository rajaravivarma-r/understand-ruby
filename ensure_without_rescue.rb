# Explicit return in ensure eats the unhandled exception
def explicit_return_in_ensure_without_rescue
  raise(StandardError, 'Raising exception')
ensure
  puts 'From ensure in explicit_return_in_ensure_without_rescue'
  return 'hello world' # rubocop:disable Lint/EnsureReturn
end

# This bubbles up the exception to the calling site
def implicit_return_in_ensure_without_rescue
  raise(StandardError, 'Raising exception')
ensure
  puts 'From ensure in implicit_return_in_ensure_without_rescue'
  'hello world'
end

puts 'Return value from explicit_return_in_ensure_without_rescue:' \
      "#{explicit_return_in_ensure_without_rescue}"

puts 'Return value from implicit_return_in_ensure_without_rescue:' \
      "#{implicit_return_in_ensure_without_rescue}"
