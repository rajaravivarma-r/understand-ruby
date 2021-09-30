# TestCase: Can you return from calling method by yielding a lambda in the
# called method
#
# Result: No it cannot be done.
def _augment(&block)
  yield
end

def augment_block_with_return_and_yield(&block)
  block_deco = lambda do
    puts "Returning from a new block"
    block.call if block
  end
  _augment(&block_deco)
end

def test_if_returning_by_augmented_block_returns_from_this_method
  augment_block_with_return_and_yield { return }
  puts "Returning from augmented block did not work"
end

test_if_returning_by_augmented_block_returns_from_this_method
