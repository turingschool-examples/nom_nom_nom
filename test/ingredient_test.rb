require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"
require "pry";

class IngredientTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Ingredient, @ingredient1
    assert_equal "Cheese", @ingredient1.name
    assert_equal "oz", @ingredient1.unit
    assert_equal 50, @ingredient1.calories
  end
end
