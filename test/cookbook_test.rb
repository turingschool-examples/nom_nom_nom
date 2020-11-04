require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require "./lib/pantry"

class CookBookTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end
end
