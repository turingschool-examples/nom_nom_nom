require "minitest/autorun"
require "minitest/pride"
require "./lib/recipe"
require './lib/ingredient'
require './lib/pantry'
require './lib/cookbook'

class RecipeTest < Minitest::Test
  def test_it_exists_and_has_attributes
    recipe1 = Recipe.new("Mac and Cheese")

    assert_instance_of Recipe, recipe1
    assert_equal "Mac and Cheese", recipe1.name
  end

  def test_can_add_ingredients_required
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})

    assert_equal ({}), recipe1.ingredients_required

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expected_hash = {ingredient1 => 6, ingredient2 => 8}
    assert_equal expected_hash, recipe1.ingredients_required

    expected_array = [ingredient1, ingredient2]
    assert_equal expected_array, recipe1.ingredients
  end
end
