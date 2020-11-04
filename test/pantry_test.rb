require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"

class PantryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    pantry = Pantry.new
    
    expected = {}
    assert_equal expected, pantry.stock
  end
end
