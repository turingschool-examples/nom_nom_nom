require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/recipe'
require './lib/pantry'
require './lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Recipe, @recipe1
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ({}), @recipe1.ingredients_required
  end

  def test_add_ingredients
    required = {
      @ingredient1 => 6,
      @ingredient2 => 8
    }
    
    @recipe1.add_ingredients(@ingredient1, 2)
    @recipe1.add_ingredients(@ingredient1, 4)
    @recipe1.add_ingredients(@ingredient2, 8)


    assert_equal required, @recipe1.ingredients_required
  end

  def test_recipe_ingredients
    @recipe1.add_ingredients(@ingredient1, 2)
    @recipe1.add_ingredients(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end
end