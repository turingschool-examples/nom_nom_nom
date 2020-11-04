require "minitest/autorun"
require "minitest/pride"
require "./lib/recipe"
require "mocha/minitest"

class RecipeTest < Minitest::Test
  def setup
    @recipe = Recipe.new("Mac and Cheese")

    @ingredient1 = mock()
    @ingredient1.stubs("name").returns("Cheese")
    @ingredient1.stubs("unit").returns("oz")
    @ingredient1.stubs("calories").returns("50")

    @ingredient2 = mock()
    @ingredient2.stubs("name").returns("Macaroni")
    @ingredient2.stubs("unit").returns("oz")
    @ingredient2.stubs("calories").returns("200")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Recipe, @recipe

    assert_equal Hash.new(), @recipe.ingredients_required
  end

  def test_it_adds_ingredient
    assert_equal Hash.new(), @recipe.ingredients_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient1, 4)
    @recipe.add_ingredient(@ingredient2, 8)
    expected = {
      @ingredient1 => 6,
      @ingredient2 => 8
    }
    assert_equal expected, @recipe.ingredients_required
  end
end
