require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cookbook'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'

class CookbookTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
  end

  def test_it_exists	
    assert_instance_of Cookbook, @cookbook
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal "Invalid recipe!", @cookbook.add_recipe("McMuffin")
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
    
  end

  def test_highest_calorie_meal
    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end
end