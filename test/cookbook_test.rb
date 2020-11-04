require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require "./lib/cookbook"

class CookBookTest < Minitest::Test
  def setup

    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  def test_it_exists

    assert_instance_of CookBook, @cookbook
  end

  def test_cookbook_adds_recipes

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test
end
