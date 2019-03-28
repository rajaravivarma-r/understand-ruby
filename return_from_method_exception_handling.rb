def with_begin_rescue
  retry_count = 0
  begin
    yield
    'return from not exception'
  rescue StandardError
    'return from exception'
  end
end

def with_begin_rescue_but_another_return
  retry_count = 0
  begin
    yield
    'return from not exception'
  rescue StandardError
    'return from exception'
  end
  'explicit retury from method'
end

def with_just_rescue
  yield
  'return from not exception'
rescue StandardError
  'return from exception'
end

puts "Successful: from with_begin_rescue: #{with_begin_rescue { 'hi' }}"
puts "Successful: from with_just_rescue: #{with_begin_rescue { 'hi' }}"
puts 'Successful: from with_begin_rescue_but_another_return: '\
  "#{with_begin_rescue_but_another_return { 'hi' }}"

e = StandardError.new('error')
puts "Exception: from with_begin_rescue: #{with_begin_rescue { raise e }}"
puts "Exception: from with_just_rescue: #{with_begin_rescue { raise e }}"
puts 'Exception: from with_begin_rescue_but_another_return: '\
  "#{with_begin_rescue_but_another_return { raise e }}"
