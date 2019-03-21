def actual_method_which_yields_the_block(range)
  for i in range do
    yield(i)
  end
end

def helper_method_which_sets_up_context_for_the_actual_method
  context_name = 'one to ten'
  yielder_with_context_name = lambda do |number|
    yield(context_name, number)
  end
  actual_method_which_yields_the_block(1..10, &yielder_with_context_name)
end

helper_method_which_sets_up_context_for_the_actual_method do |context_name, no|
  puts "Context name: #{context_name}"
  puts "Number: #{no}"
end
