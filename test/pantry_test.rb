require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test
    
    def setup
        @pantry = Pantry.new
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        @recipe1 = Recipe.new("Mac and Cheese")
    end

    def test_it_exsist_and_has_attributes

        expected = {}

        assert_instance_of Pantry, @pantry
        assert_equal expected, @pantry.stock
    end

    def test_stock_check

        expected = 0

        assert_equal expected, @pantry.stock_check(@ingredient1)
    end 

    def test_it_can_restock

        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)
        @pantry.restock(@ingredient2, 7)

        assert_equal 15, @pantry.stock_check(@ingredient1)
        assert_equal 7, @pantry.stock_check(@ingredient2)
    end

    def test_enough_ingredients_for?
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)

        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)

        assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 7)
        assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 1)
        assert_equal false, @pantry.enough_ingredients_for?(@recipe1)
    end
end