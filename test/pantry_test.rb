require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end
  def test_it_exists
    stock_result = {}
    assert_instance_of Pantry, @pantry 
    assert_equal stock_result, @pantry.stock
  end
end