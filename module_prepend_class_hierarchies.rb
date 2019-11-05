# frozen_string_literal: true

module PrependRun
  def run
    puts 'Running from Module'
    super
    puts 'Ended running from Module'
  end
end

class BasePrependingClass
  prepend PrependRun

  def run
    puts 'Running from the BasePrependingClass class'
  end
end

class InheritedPrependingClass < BasePrependingClass
  def run
    puts 'Running from the InheritedPrependingClass'
  end
end

base_prepending_class = BasePrependingClass.new
base_prepending_class.run
puts BasePrependingClass.ancestors

inherited_prepending_class = InheritedPrependingClass.new
inherited_prepending_class.run
puts InheritedPrependingClass.ancestors
