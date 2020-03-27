# frozen_string_literal: true

require 'date'

class User
  def born_on
    Date.new(1989, 9, 10)
  end

  private

  def gender
    'M'
  end
end

class UserDecorator < SimpleDelegator
  def birth_year
    born_on.year
  end

  def readable_gender
    gender == 'M' ? 'Male' : 'Female'
  end
end

ud = UserDecorator.new(User.new)

puts ud.birth_year
begin
  puts ud.readable_gender
rescue NameError
  puts 'Expected failure occurred'
end
