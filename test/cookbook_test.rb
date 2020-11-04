require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cookbook'
require './lib/recipe'
require './lib/ingredient'

class CookbookTest < Minitest::Test
    def setup
        @cookbook = CookBook.new
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    end

    def test_it_exsist_and_has_attributes

        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)

        expected = [@recipe1, @recipe2]

        assert_instance_of CookBook, @cookbook
        assert_equal expected, @cookbook.recipes
    end

    def test_recipes

        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)

        expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
        assert_equal expected, @cookbook.ingredients
    end

    def test_highest_calorie_meal

        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        
        assert_equal @recipe2, @cookbook.highest_calorie_meal
    end
end