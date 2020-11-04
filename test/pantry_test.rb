require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"

class PantryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    pantry = Pantry.new

    expected = {}
    assert_equal expected, pantry.stock
  end

  def test_pantry_can_stock_check
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    assert_equal 0, pantry.stock_check(ingredient1)
  end
end
