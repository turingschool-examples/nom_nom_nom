require "minitest/autorun"
require "minitest/pride"
require "./lib/recipe"
require './lib/ingredient'
require './lib/pantry'
require './lib/cookbook'

class CookBookTest < Minitest::Test
  def test_it_exists_and_has_attributes
    cookbook = CookBook.new

    assert_instance_of CookBook, cookbook
    assert_equal [], cookbook.recipes
  end

  def test_can_add_recipe
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expected_array = [recipe1, recipe2]
    assert_equal expected_array, cookbook.recipes
  end

  def test_total_calories_in_recipe
    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({
                  name: "Ground Beef",
                  unit: "oz",
                  calories: 100})
    ingredient4 = Ingredient.new({
                  name: "Bun",
                  unit: "g",
                  calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    assert_equal 440, recipe1.total_calories
    assert_equal 675, recipe2.total_calories
  end

  def test_ingredients_for_given_recipes
    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({
                  name: "Ground Beef",
                  unit: "oz",
                  calories: 100})
    ingredient4 = Ingredient.new({
                  name: "Bun",
                  unit: "g",
                  calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expected_array = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
    assert_equal expected_array, cookbook.ingredients
  end

  def test_highest_calorie_meal
    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({
                  name: "Ground Beef",
                  unit: "oz",
                  calories: 100})
    ingredient4 = Ingredient.new({
                  name: "Bun",
                  unit: "g",
                  calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal recipe2, cookbook.highest_calorie_meal
  end

  def test_enough_ingredients_for_specific_recipe
    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({
                  name: "Ground Beef",
                  unit: "oz",
                  calories: 100})
    ingredient4 = Ingredient.new({
                  name: "Bun",
                  unit: "g",
                  calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    refute pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 7)

    refute pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 1)

    assert pantry.enough_ingredients_for?(recipe1)
  end

  def test_date_it_was_created
    cookbook = CookBook.new
    cookbook.add_date_created("04-22-2020")

    assert_equal "04-22-2020", cookbook.date
  end

  def test_cookbook_summary
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({
                  name: "Cheese",
                  unit: "C",
                  calories: 100})
    ingredient2 = Ingredient.new({
                  name: "Macaroni",
                  unit: "oz",
                  calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({
                  name: "Ground Beef",
                  unit: "oz",
                  calories: 100})
    ingredient4 = Ingredient.new({
                  name: "Bun",
                  unit: "g",
                  calories: 1})
    recipe2 = Recipe.new("Burger")
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expected_array = [
                      {
                      :name=>"Mac and Cheese",
                      :details=>
                        {:ingredients=>
                          [{:ingredient=>"Macaroni", :amount=>"8 oz"},
                          {:ingredient=>"Cheese", :amount=>"2 C"}], 
                      :total_calories=>440}},
                      {
                      :name=>"Burger",
                      :details=>
                        {:ingredients=>
                          [{:ingredient=>"Ground Beef", :amount=>"4 oz"},
                          {:ingredient=>"Bun", :amount=>"100 g"}],
                      :total_calories=>500}}]
    assert_equal expected_array, cookbook.summary
  end
end
