require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cookbook'
require './lib/pantry'
require './lib/ingredient'

class CookbookTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new
  end

  def test_it_exists	
    assert_instance of Cookbook, @cookbook
  end
end