require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require '.lib/ingredient'

class RecipeTest < Minitest::Test
  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")

    assert_equal Recipe, recipe1
  end

  def test_ingredients_can_be_required
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")

    assert_equal {}, recipe1.ingredients_required
  end

end
