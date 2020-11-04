require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require "./lib/pantry"

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end
