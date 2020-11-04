require 'minitest/autorun'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class IntegrationTest < MiniTest::Test

    def setup
        @pantry = Pantry.new
        @cookbook = CookBook.new
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    end

    def test_recipe_can_get_total_calories
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)

        assert_equal 440, @recipe1.total_calories
        assert_equal 675, @recipe2.total_calories
    end

    def test_cookbook_can_list_all_ingredients_from_recipes
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)

        expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
        assert_equal expected, @cookbook.ingredients
    end

    def test_cookbook_can_find_highest_calorie_meal

    end

end