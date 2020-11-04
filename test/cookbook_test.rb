require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

class CookbookTest < Minitest::Test
  def test_it_exists_and_has_attributes
    cookbook = Cookbook.new

    assert_instance_of Cookbook, cookbook
  end

  def test_can_add_recipe
    cookbook = Cookbook.new

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    assert_equal Array, cookbook.recipes
  end

end
