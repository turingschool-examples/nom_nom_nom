require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  def test_it_exists	
    ingredients_result = {}

    assert_instance_of Recipe, @recipe1
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ingredients_result, @recipe1.ingredients_required
  end
end