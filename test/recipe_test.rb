require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class RecipeTest < Minitest::Test
    def setup
        # @pantry = Pantry.new
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

        expected = {}

        assert_instance_of Recipe, @recipe1
        assert_equal "Mac and Cheese", @recipe1.name
        assert_equal expected, @recipe1.ingredients_required
    end

    def test_it_can_add_ingredients
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient1, 4)
        @recipe1.add_ingredient(@ingredient2, 8)
        expected1 = {@ingredient1 => 6, @ingredient2 => 8}
        expected2 = [@ingredient1, @ingredient2]
        assert_equal expected1, @recipe1.ingredients_required
        assert_equal expected2, @recipe1.ingredients
    end

end