# The script is written to understand if a method marked as module_function
# in a module will acts as an instance_method too

module A
  def module_instance_method
    'Instance method'
  end
  module_function :module_instance_method
end

class B
  include A
end

b = B.new

puts "Calling module_instance_method as module_function returns: #{A.module_instance_method}"
puts "Calling module_instance_method as class method on B returns: #{B.module_instance_method}" # Doesn't work
puts "Calling module_instance_method as instance_method of a returns: #{b.module_instance_method}" # Doesn't work
