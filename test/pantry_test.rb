require 'minitest/autorun'            # => true
require 'minitest/pride'              # => true
require_relative '../lib/ingredient'  # => true
require_relative '../lib/pantry'      # => true
require_relative '../lib/recipe'      # => true


class PantryTest < Minitest::Test  # => Minitest::Test

  def test_it_exists_and_has_attributes
    pantry = Pantry.new                  # => #<Pantry:0x00007fcd199494c0 @stock={}>

    expected = {}  # => {}

    assert_equal expected, pantry.stock  # => true
  end                                    # => :test_it_exists_and_has_attributes

  def test_it_can_check_and_add_stock
    pantry = Pantry.new                # => #<Pantry:0x00007fcd1996a4e0 @stock={}>

    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})     # => #<Ingredient:0x00007fcd19968cd0 @name="Cheese", @unit="oz", @calories=50>
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})  # => #<Ingredient:0x00007fcd199630c8 @name="Macaroni", @unit="oz", @calories=200>

    assert_equal 0, pantry.stock_check(ingredient1)  # => true

    pantry.restock(ingredient1, 5)   # => 5
    pantry.restock(ingredient1, 10)  # => 15

    assert_equal 15, pantry.stock_check(ingredient1)  # => true

    pantry.restock(ingredient2, 7)  # => 7

    assert_equal 7, pantry.stock_check(ingredient2)  # => true
  end                                                # => :test_it_can_check_and_add_stock

  def test_it_gives_enough_ingredients_for
    pantry = Pantry.new                     # => #<Pantry:0x00007fcd19941cc0 @stock={}>
    recipe1 = Recipe.new("Mac and Cheese")  # => #<Recipe:0x00007fcd19941b08 @name="Mac and Cheese", @ingredients_required={}>

    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})    # => #<Ingredient:0x00007fcd19939d40 @name="Cheese", @unit="C", @calories=100>
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})  # => #<Ingredient:0x00007fcd199324c8 @name="Macaroni", @unit="oz", @calories=30>

    recipe1.add_ingredient(ingredient1, 2)  # => 2
    recipe1.add_ingredient(ingredient2, 8)  # => 8

    pantry.restock(ingredient1, 5)   # => 5
    pantry.restock(ingredient1, 10)  # => 15

    assert_equal false, pantry.enough_ingredients_for?(recipe1)  # => true

    pantry.restock(ingredient2, 7)  # => 7

    assert_equal false, pantry.enough_ingredients_for?(recipe1)  # => true

    pantry.restock(ingredient2, 1)  # => 8
    
    assert_equal true, pantry.enough_ingredients_for?(recipe1)
  end                                                           # => :test_it_gives_enough_ingredients_for

end  # => :test_it_gives_enough_ingredients_for

# >> Run options: --seed 33955
# >> 
# >> # Running:
# >> 
# >> ..F
# >> 
# >> Finished in 0.000980s, 3061.2245 runs/s, 7142.8571 assertions/s.
# >> 
# >>   1) Failure:
# >> PantryTest#test_it_gives_enough_ingredients_for [pantry_test.rb:57]:
# >> Expected: true
# >>   Actual: false
# >> 
# >> 3 runs, 7 assertions, 1 failures, 0 errors, 0 skips