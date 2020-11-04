require './lib/ingredient'
require './lib/pantry'
require 'minitest/autorun'

class IngredientTest < MiniTest::Test

    def setup
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) 
    end

    def test_it_can_instantiate
        assert_equal "Cheese", @ingredient1.name
        assert_equal "oz", @ingredient1.unit
        assert_equal 50, @ingredient1.calories
    end
end