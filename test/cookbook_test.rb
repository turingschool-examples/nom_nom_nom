require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
require_relative '../lib/recipe'
require_relative '../lib/cookbook'

class CookBookTest < Minitest::Test

  def test_it_exists_and_has_attributes
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    assert_instance_of CookBook, cookbook
    assert_equal [], cookbook.recipes
  end

  def test_it_adds_recipes
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal [recipe1, recipe2], cookbook.recipes
  end

end