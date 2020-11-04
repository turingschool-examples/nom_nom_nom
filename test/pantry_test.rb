require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_can_check_stock_and_restock_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({
                                  name: "Cheese",
                                  unit: "oz",
                                  calories: 50})

    assert_equal 0, pantry.stock_check(ingredient1)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)
  end
end
