require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  def test_attributes
    assert_instance_of CookBook, @cookbook

    assert_equal [], @cookbook.recipes
  end
end