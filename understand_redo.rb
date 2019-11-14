# frozen_string_literal: true

# Understand redo in loop
#
def return_with_redo
  [1, 2, 3].each do |i|
    puts i
    redo if i >= 3
  end
end

return_with_redo
