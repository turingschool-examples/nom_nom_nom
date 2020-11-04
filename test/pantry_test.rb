require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/pantry"

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = mock()
    @ingredient1.stubs("name").returns("Cheese")
    @ingredient1.stubs("unit").returns("oz")
    @ingredient1.stubs("calories").returns("50")

    @ingredient2 = mock()
    @ingredient2.stubs("name").returns("Macaroni")
    @ingredient2.stubs("unit").returns("oz")
    @ingredient2.stubs("calories").returns("200")
  end

  def test_it_exists_and_has_attribute
    assert_instance_of Pantry, @pantry

    assert_equal Hash.new, @pantry.stock
  end

  def test_it_restocks
    assert_equal 5, @pantry.restock(@ingredient1, 5)
    assert_equal 7, @pantry.restock(@ingredient2, 7)
  end

  def test_it_stock_checks
    assert_equal 0, @pantry.stock_check(@ingredient1)
    assert_equal 0, @pantry.stock_check(@ingredient2)

    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 7)
    @pantry.restock(@ingredient2, 2)

    assert_equal 12, @pantry.stock_check(@ingredient1)
    assert_equal 2, @pantry.stock_check(@ingredient2)
  end
end
