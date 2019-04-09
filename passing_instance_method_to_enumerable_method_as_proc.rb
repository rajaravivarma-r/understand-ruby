class AnyKlass
  def initialize(arr)
    @arr = arr
  end

  def pass_each_element_of_the_array_to_an_instance_method
    # This won't work as &:method_name is essentially
    # arr.each { |e| e.send(:method_name) }
    arr.each(&:instance_method_which_prints)
  end

  private

  attr_reader :arr

  def instance_method_which_prints(e)
    puts e
  end
end

ak = AnyKlass.new(%w(Raja Ravi Varma))
ak.pass_each_element_of_the_array_to_an_instance_method
