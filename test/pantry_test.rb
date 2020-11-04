require './lib/ingredient'
require './lib/pantry'
require 'minitest/autorun'

class PantryTest < MiniTest::Test

    def setup
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) 
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        @pantry = Pantry.new
    end

    def test_it_can_instantiate
        expected = {}
        assert_equal expected, @pantry.stock
    end

    def test_it_can_check_stock_for_ingredient
        assert_equal 0, @pantry.stock_check(@ingredient1)
    end
end