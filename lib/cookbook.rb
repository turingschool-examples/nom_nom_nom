require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

class CoockbookTest < Minitest::Test
    def setup
        @cookbook = CookBook.new
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @ingredient1 = Ingredient.new(
            {
                name: "Cheese",
                unit: "C",
                calories: 100
            }
        )
        @ingredient2 = Ingredient.new(
            {
                name: "Macaroni",
                unit: "oz",
                calories: 30
            }
        )
    end

    def test_it_exists_and_has_attributes
        assert_instance_of CookBook, @cookbook
        assert_equal [], @cookbook.recipes
    end

    def test_it_can_add_recipes
        skip
        recipe1.add_ingredient(ingredient1, 2)
        recipe1.add_ingredient(ingredient1, 4)
        recipe1.add_ingredient(ingredient2, 8)
        cookbook.add_recipe(@recipe1)
        cookbook.add_recipe(@recipe2)

        assert_equal [@recipe1, @recipe2], cookbook.recipes
    end
end