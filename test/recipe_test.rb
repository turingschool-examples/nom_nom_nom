require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Recipe, @recipe1
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ({}), @recipe1.ingredients_required
  end

  def test_add_ingredient
    required = {
      @ingredient1 => 6,
      @ingredient2 => 8
    }
    
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)


    assert_equal required, @recipe1.ingredients_required
    assert_equal "Invalid ingredient!", @recipe1.add_ingredient("Paprika", 1)
  end

  def test_recipe_ingredients
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end

  def test_total_calories
    assert_equal 675, @recipe2.total_calories
  end
end