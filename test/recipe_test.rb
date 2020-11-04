require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require "./lib/recipe"
require "./lib/pantry"
require "./lib/cookbook"

class RecipeTest < Minitest::Test
  def setup
    @pantry = Pantry.new

    @cookbook = CookBook.new

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  def test_it_exists

    assert_instance_of Recipe, @recipe1
  end

  def test_attributes

    assert_equal "Mac and Cheese", @recipe1.name
  end

  def test_recipe_adds_ingredients

    assert_equal ({}), @recipe1.ingredients_required

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    assert_equal ({@ingredient1 => 6, @ingredient2 => 8}), @recipe1.ingredients_required
    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end

  def test_total_calories

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    assert_equal 440, @recipe1.total_calories
    assert_equal 675, @recipe2.total_calories
  end
end
