require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

class CookBookTest < MiniTest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @pantry = Pantry.new
    @cookbook = CookBook.new
  end

  def test_attributes_are_instantiated
    assert_instance_of CookBook, @cookbook
    assert_equal [], @cookbook.recipes
  end

  def test_can_add_recipes_to_cookbook
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_list_all_ingredients_in_cookbook
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end
end