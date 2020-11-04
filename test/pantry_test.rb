require "minitest/autorun"
require "minitest/pride"
require "./lib/pantry"

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_exists_and_has_attribute
    assert_instance_of Pantry, @pantry

    assert_equal Hash.new, @pantry.stock
  end
end
