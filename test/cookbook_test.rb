require 'minitest/autorun'
require 'minitest/pride'
require './lib/cookbook'

class CookBookTest < Minitest::Test

  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
    assert_equal [], cookbook.recipes

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    assert_equal [recipe1, recipe2], cookbook.recipes
  end
end
