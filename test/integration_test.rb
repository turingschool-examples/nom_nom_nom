require 'minitest/autorun'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'date'

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
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)

        assert_equal @recipe2, @cookbook.highest_calorie_meal
    end

    def test_pantry_can_check_if_enough_ingredients_for_recipe
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)

        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)

        assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 7)

        assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

        @pantry.restock(@ingredient2, 1)

        assert_equal true, @pantry.enough_ingredients_for?(@recipe1)
    end
# Iteration 4 tests
    def test_cookbook_can_find_date_of_its_creation
        assert_equal "11-04-2020", @cookbook.date
    end

end