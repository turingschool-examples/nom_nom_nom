require 'minitest/autorun'
require 'minitest/pride'
require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'


class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new  #<CookBook:0x00007faae6a42228 @recipes=[]>
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of CookBook, @cookbook
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_find_the_highest_calorie_meal
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
    assert_equal @recipe2, @cookbook.highest_calorie_meal
# @pantry.restock(ingredient1, 5)

# @pantry.restock(ingredient1, 10)

# @pantry.enough_ingredients_for?(recipe1)
# # => false

# @pantry.restock(ingredient2, 7)

# @pantry.enough_ingredients_for?(recipe1)
# # => false

# @pantry.restock(ingredient2, 1)

# @pantry.enough_ingredients_for?(recipe1)
# # => true
  end
end