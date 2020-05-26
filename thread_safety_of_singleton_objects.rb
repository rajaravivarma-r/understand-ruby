# frozen_string_literal: true

require 'singleton'

class DoorLock
  include Singleton

  def initialize(locked = true)
    @locked = locked
    @mutex  = Mutex.new
  end

  def open?
    with_mutex do
      !@locked
    end
  end

  def unlock!
    unless open?
      puts 'Opening the door!'
      @locked = false
    end
  end

  private

  def with_mutex
    @mutex.synchronize { yield }
  end
end

9.times.map do
  Thread.new do
    door_lock = DoorLock.instance
    door_lock.unlock! unless door_lock.open?
  end
end.each(&:join)
