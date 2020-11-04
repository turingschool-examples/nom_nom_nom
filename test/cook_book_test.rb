require "minitest/autorun"
require "minitest/pride"
require "./lib/"
require "mocha/minitest"

class CookBookTest < Minitest::Test
  def setup
    @cook_book = CookBook.new
    @recipe1 = mock()
    @recipe2 = mock()
  end

  def test_it_exists_and_has_attributes
    assert_instance_of CookBook, @cook_book

    assert_equal [], @cook_book.recipes
  end
end
