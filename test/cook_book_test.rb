require 'minitest/autorun'
require 'minitest/pride'
require './lib/cook_book'
require './lib/ingredient'
require './lib/recipe'

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end
  def test_it_exists_and_has_attributes
    assert_instance_of CookBook, @cookbook
  end
end
