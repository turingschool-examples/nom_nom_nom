require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_it_exists_and_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
    expected = {}
    assert_equal expected, @recipe1.ingredients_required
  end
end
