require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test

  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_it_can_stock_ingredients
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check(ingredient1)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    assert_equal 15, pantry.stock_check(ingredient1)

    pantry.restock(ingredient2, 7)
    assert_equal 7, pantry.stock_check(ingredient2)
  end

  def test_enough_ingredients_for?
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1 = Recipe.new("Mac and Cheese")
    pantry = Pantry.new

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal false, pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 7)
    assert_equal false, pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 1)
    assert_equal true, pantry.enough_ingredients_for?(recipe1)
  end
end
