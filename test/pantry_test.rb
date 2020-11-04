require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  def test_it_exists_and_has_attributes
    expected = {}
    assert_equal expected, @pantry.stock
  end
end
