# frozen_string_literal: true

require 'singleton'

class MyObject
  include Singleton

  def initialize
    @things = []
    @mutex  = Mutex.new
  end

  def add(thing)
    @things << thing
    i = @things.size
    j = i * 10
    puts i
  end

  def things
    with_mutex { @things }
  end

  def clear
    with_mutex do
      @things.clear
    end
  end

  def self.add(thing)
    instance.add(thing)
  end

  def self.things
    instance.things
  end

  def self.clear
    instance.clear
  end

  private

  def with_mutex
    @mutex.synchronize { yield }
  end
end

threads = 10.times.map do
  Thread.new { 1000.times { |i| MyObject.add(i) } }
end
threads.map(&:join)

puts MyObject.things.size
