require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  def test_empty_string
    assert_equal 0, Calculator.add("")
  end

  def test_single_number
    assert_equal 1, Calculator.add("1")
  end

  def test_two_numbers
    assert_equal 6, Calculator.add("2,6")
  end

  def test_multiple_numbers
    assert_equal 15, Calculator.add("1,2,3,4,5")
  end

  def test_invalid_input
    assert_raises(ArgumentError) { Calculator.add() }
  end
end
