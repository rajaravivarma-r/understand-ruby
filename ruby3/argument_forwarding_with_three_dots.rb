def receiver(arg_one, arg_two, arg_three)
  puts "arg_one: #{arg_one}"
  puts "arg_two: #{arg_two}"
  puts "arg_three: #{arg_three}"
end

def direct_receiver(arg_one, ...)
  receiver(arg_one, ...)
end

direct_receiver('Arg 1', 'Arg 2', 'Arg 3')
