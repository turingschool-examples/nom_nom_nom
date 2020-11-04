require "minitest/autorun"
require "minitest/pride"
require "./lib/cook_book"
require "./lib/recipe"
require "mocha/minitest"


class CookBookTest < Minitest::Test
  def setup
    @cook_book = CookBook.new

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheeseburger")

    @ingredient1 = mock()
    @ingredient1.stubs("name").returns("Cheese")
    @ingredient1.stubs("unit").returns("C")
    @ingredient1.stubs("calories").returns("100") #*2

    @ingredient2 = mock()
    @ingredient2.stubs("name").returns("Macaroni")
    @ingredient2.stubs("unit").returns("oz")
    @ingredient2.stubs("calories").returns("30") #*8

    @ingredient3 = mock()
    @ingredient3.stubs("name").returns("Ground Beef")
    @ingredient3.stubs("unit").returns("oz")
    @ingredient3.stubs("calories").returns("100") #*2

    @ingredient4 = mock()
    @ingredient4.stubs("name").returns("Bun")
    @ingredient4.stubs("unit").returns("g")
    @ingredient4.stubs("calories").returns("75") #*8

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of CookBook, @cook_book

    assert_equal [], @cook_book.recipes
  end

  def test_it_adds_recipe
    assert_equal [], @cook_book.recipes

    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)

    assert_equal [@recipe1,@recipe2], @cook_book.recipes
  end

  def test_ingredients
    assert_equal [], @cook_book.ingredients

    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)

    assert_equal ["Cheese","Macaroni","Ground Beef","Bun"], @cook_book.ingredients
  end
end
