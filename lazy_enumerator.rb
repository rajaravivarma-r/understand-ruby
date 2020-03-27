# frozen_string_literal: true

require 'pry'

class Enumerator::Lazy
  def filter_map
    Lazy.new(self) do |yielder, *values|
      binding.pry
      result = yield *values
      yielder << result if result
    end
  end
end

enum = Enumerator.new do |y|
  5.times do |i|
    y << i
  end
  puts 'Sleeping'
  sleep
end

puts enum.lazy.take_while { |i| i < 4 }.force

# [1, 2, 3, 4, 5].lazy.filter_map { |i, j| puts j; i * 2 if i.even? }.force
