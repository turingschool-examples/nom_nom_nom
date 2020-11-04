require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
require_relative '../lib/recipe'

class RecipeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    recipe1 = Recipe.new("Mac and Cheese")

    expected = {}
    assert_equal "Mac and Cheese", recipe1.name
    assert_equal expected, recipe1.ingredients_required
  end

end