# frozen_string_literal: true
#
# Incomplete example

require 'singleton'

class SingletonObject
  include Singleton

  def initialize
    @things = []
    @mutex  = Mutex.new
  end

  def add(thing)
    with_mutex { @things << thing }
  end

  def things
    with_mutex { @things }
  end

  def clear
    with_mutex { @things.clear }
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
    # @mutex.synchronize { yield }
    yield
  end
end

class NotSingletonObject
  def initialize
    @things = 0
  end

  def increment
    @things += 1
  end

  attr_reader :things
end

class ClassLevel
  class << self
    attr_reader :things
    attr_writer :things

    def increment
      @things += 1
    end
  end
end

ClassLevel.things = 0

def add_items_to_singleton_object
  my_object = SingletonObject.instance
  100_000.times { |i| my_object.add(i) }
end

@not_singleton_object = NotSingletonObject.new
def add_items_not_singleton_object
  10_000.times { |_i| @not_singleton_object.increment }
end

def add_items_class_level
  10.times do
    ClassLevel.increment
    sleep(rand)
  end
end

threads = 10.times.map do
  Thread.new do
    add_items_class_level
  end
end
threads.map(&:join)

puts "SingletonObject.instance.things.size: #{SingletonObject.instance.things.size}"

puts "@not_singleton_object.things.size: #{@not_singleton_object.things}"

puts "ClassLevel.things: #{ClassLevel.things}"
