require 'minitest/autorun'
require './lib/cookbook'
require './lib/recipe'
require './lib/ingredient'

class CookBookTest < MiniTest::Test

    def setup
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @cookbook = CookBook.new
    end

    def test_it_can_instantiate
        assert_equal [], @cookbook.recipes
    end

end