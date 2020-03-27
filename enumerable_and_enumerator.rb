# frozen_string_literal: true

require 'test/unit'

class TestEnumerable
  include Enumerable

  def each
    return enum_for(:each) unless block_given?

    5.times { |i| yield i }
  end
end

class TestNonEnumerable
  def each
    return enum_for(:each) unless block_given?

    5.times { |i| yield i }
  end
end

class TestEnumerableClass < Test::Unit::TestCase
  def initialize(*args)
    super
    @enumerable = TestEnumerable.new
  end

  def test_responding_to_each
    assert_nothing_raised { @enumerable.each { |i| i * 10 } }
  end

  def test_responding_to_map
    assert_nothing_raised { @enumerable.map { |i| i * 10 } }
  end

  def test_map_values
    assert_equal @enumerable.map { |i| i * 2 }, [0, 2, 4, 6, 8]
  end
end

class TestNonEnumerableClass < Test::Unit::TestCase
  def initialize(*args)
    super
    @enumerable = TestNonEnumerable.new
  end

  def test_responding_to_each
    assert_nothing_raised { @enumerable.each { |i| i * 10 } }
  end

  def test_responding_to_map
    assert_raise(NoMethodError) { @enumerable.map { |i| i * 10 } }
  end
end
