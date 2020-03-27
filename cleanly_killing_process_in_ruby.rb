# frozen_string_literal: true

@interrupt = false

def run_background_thread
  t = Thread.new do
    loop do
      break if @interrupt

      10.times { |i| sleep 1; puts i }
      puts "\n"
    end
  end
  t.join
rescue Interrupt
  @interrupt = true
  t.join
end

run_background_thread
