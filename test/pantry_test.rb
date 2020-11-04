require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test
    def setup
        @pantry = Pantry.new
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
        @ingredient3 = Ingredient.new(
            {
                name: "Ground Beef",
                unit: "oz",
                calories: 100
                }
            )
        @ingredient4 = Ingredient.new(
            {
                name: "Bun",
                unit: "g",
                calories: 75
                }
            )
        @ingredientA = Ingredient.new(
            {
                name: "Cheese",
                unit: "oz",
                calories: 50
            }
        )
        @ingredientB = Ingredient.new(
            {
                name: "Macaroni",
                unit: "oz",
                calories: 200
            }
        )
    end

    def test_it_exists_and_has_attributes
        expected = {}

        assert_instance_of Pantry, @pantry
        assert_equal expected, @pantry.stock
        assert_equal 0, @pantry.stock_check
    end

    def test_it_can_restock_pantry
        @pantry.restock(@ingredientA, 5)
        @pantry.restock(@ingredientA, 10)

        assert_equal 15, @pantry.stock_check(@ingredientA)

        @pantry.restock(@ingredientB, 7)
        assert_equal 7, @pantry.stock_check(@ingredientB)
    end

    def new_test
        skip
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        # @cookbook.add_recipe(@recipe1)
        # @cookbook.add_recipe(@recipe2)
        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)

        refute @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 7)

        refute @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 1)

        assert @pantry.enough_ingredients_for?(@recipe1)
    end
end