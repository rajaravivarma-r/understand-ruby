# frozen_string_literal: true

def puts(...)
  super(...)
  super()
end

class Dog
  attr_reader :name

  class << self
    def call_promethod(doc)
      puts 'Calling protected method from Doc.call_promethod'
      doc.pro_meth
    end
  end

  def initialize(name)
    @name = name
  end

  def execute_pro(dog)
    dog.pro_meth
  end

  protected

  def pro_meth
    puts "protected #{name}"
  end
end

class Poodle < Dog
  def dostuff(dog)
    puts 'Calling pro_meth from Poodle#dostuff'
    dog.pro_meth
  end
end

class Cat
  def dostuff(dog)
    dog.pro_meth
  end
end

def main
d1 = Dog.new('Doc d1')
d2 = Dog.new('Doc d2')

p1 = Poodle.new('Poodle p1')
c1 = Cat.new

p1.dostuff d1
begin
  c1.dostuff d1
rescue StandardError => e
  puts e.message
  puts "Cannot call protected method from an object belonging to different class"
end

begin
  Dog.call_promethod(d2)
rescue StandardError => e
  puts e.message
  puts "Cannot call protected method from the same class too"
end
end

main
