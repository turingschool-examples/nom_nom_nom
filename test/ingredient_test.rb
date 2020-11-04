require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  def test_it_has_attributes
    assert_instance_of Ingredient, @ingredient1

    assert_equal "Cheese", @ingredient1.name
    assert_equal "oz", @ingredient1.unit 
    assert_equal 50, @ingredient1.calories
  end
end