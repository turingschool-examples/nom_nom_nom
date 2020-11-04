require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
    @pantry = Pantry.new
  end

  def test_attributes
    assert_instance_of CookBook, @cookbook

    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@recipe1)

    @cookbook.add_recipe(@recipe2)

    expected = [@recipe1, @recipe2]
    assert_equal expected, @cookbook.recipes
  end

  def test_total_calories
    @recipe1.add_ingredient(@ingredient1, 2)

    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2 = Recipe.new("Cheese Burger")

    @recipe2.add_ingredient(@ingredient1, 2)

    @recipe2.add_ingredient(@ingredient3, 4)

    @recipe2.add_ingredient(@ingredient4, 1)

    assert_equal 440, @recipe1.total_calories

    assert_equal 677, @recipe2.total_calories

    @cookbook.add_recipe(recipe1)

    @cookbook.add_recipe(recipe2)

    expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
    assert_equal expected,@cookbook.ingredients
  end
end