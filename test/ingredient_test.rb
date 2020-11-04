require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'


class IngredientTest < Minitest::Test
  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({
                                  name: "Cheese",
                                  unit: "oz",
                                  calories: 50})
    assert_instance_of Ingredient, ingredient1
  end

  def test_can_stock_stock
    ingredient1 = Ingredient.new({
                                  name: "Cheese",
                                  unit: "oz",
                                  calories: 50})
    ingredient2 = Ingredient.new({
                                  name: "Macaroni",
                                  unit: "oz",
                                  calories: 200})
    pantry = Pantry.new
    pantry.stock
  end
end
