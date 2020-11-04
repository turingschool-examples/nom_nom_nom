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
  end

  def test_it_exists	
    assert_instance_of Cookbook, @cookbook
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end
end