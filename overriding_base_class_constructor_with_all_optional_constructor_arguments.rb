class Base
  def initialize(first_argument = nil, second_argument = nil)
    @first_argument = first_argument
    @second_argument = second_argument
  end

  def print_self
    puts "First argument: #{@first_argument}, "\
      "Second argument: #{@second_argument}"
  end
end

class Inherited < Base
  def initialize(second_argument = nil)
    super
    @second_argument = second_argument
  end

  def print_self
    puts "First argument: #{@first_argument}, "\
      "Second argument: #{@second_argument}"
  end
end

base = Base.new
base.print_self
base2 = Base.new('first argument', 'second argument')
base2.print_self

inherited = Inherited.new('this should be the second argument')
inherited.print_self
