# frozen_string_literal: true

class Something
  def try_something
    execute_something
  end

  private

  def execute_something
    puts 'Trying to execute something'
  end
end

something = Something.new

error_message = catch(:execution_failed) do
  something.try_something
end

puts error_message
