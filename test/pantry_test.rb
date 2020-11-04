require './lib/ingredient'
require './lib/pantry'
require 'pry'
require 'minitest/autorun'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end

end