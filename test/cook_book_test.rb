require 'minitest/autorun'
require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require 'date'

class CookBookTest < MiniTest::Test

    def setup
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @cookbook = CookBook.new
    end

    def test_it_can_instantiate
        assert_equal [], @cookbook.recipes
    end

    def test_it_can_add_recipes
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)

        expected = [@recipe1, @recipe2]
        assert_equal expected, @cookbook.recipes
    end
end