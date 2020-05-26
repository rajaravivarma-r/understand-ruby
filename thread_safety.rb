# frozen_string_literal: true

class DoorLock
  def initialize(locked)
    @locked = locked
  end

  def open?
    !@locked
  end

  def unlock!
    unless open?
      puts 'Opening the door!'
      @locked = false
    end
  end
end

door_lock = DoorLock.new(true)

5.times.map do
  Thread.new do
    door_lock.unlock! unless door_lock.open?
  end
end.each(&:join)
