module BigBangHole
  def initialize(...)
    print 'BigBangHole: '
    puts(...)
  end
end

module A
  include BigBangHole

  def initialize(attr)
    puts "A: #{attr}"
    super
  end
end

module B
  include BigBangHole

  def initialize(attr)
    puts "B: #{attr}"
    super
  end
end

class ABTest
  include A
  include B

  def initialize(attr)
    puts "ABTest: #{attr}"
    super
  end
end

class ATest
  include A

  def initialize(attr)
    puts "ATest: #{attr}"
    super
  end
end

puts 'Initializing ABTest'
ab_test = ABTest.new('value')
puts ABTest.ancestors.map(&:to_s).join(', ')

puts "\nInitializing ATest"
a_test = ATest.new('value')
