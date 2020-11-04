require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_can_check_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check(ingredient1)
  end
end
