require "minitest/autorun"
require "minitest/pride"
require "./lib/recipe"

class Test < Minitest::Test
  def setup
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Recipe, @recipe

    assert_equal {}, @recipe.ingredients_required
  end
end
