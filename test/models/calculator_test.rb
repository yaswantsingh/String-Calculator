require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  def test_empty_string
    assert_equal 0, Calculator.add("")
  end

  def test_single_number
    assert_equal 1, Calculator.add("1")
  end

  def test_two_numbers
    assert_equal 8, Calculator.add("2,6")
  end

  def test_multiple_numbers
    assert_equal 15, Calculator.add("1,2,3,4,5")
  end

  def test_invalid_input
    assert_raises(ArgumentError) { Calculator.add() }
  end

  def test_numbers_with_newlines
    assert_equal 6, Calculator.add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, Calculator.add("//;\n1;2")
  end

  def test_negative_number
    error = assert_raises(ArgumentError) { Calculator.add("1,-2,3") }
    assert_equal "Negative numbers are not allowed: -2", error.message
  end

  def test_multiple_negative_numbers
    error = assert_raises(ArgumentError) { Calculator.add("1,-2,-3,4") }
    assert_equal "Negative numbers are not allowed: -2, -3", error.message
  end

end
