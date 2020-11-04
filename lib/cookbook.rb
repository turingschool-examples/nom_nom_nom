require "date"

class Cookbook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = date_created
  end

  def add_recipe(recipe)
    if recipe.class == Recipe
      @recipes << recipe
    else
      "Invalid recipe!"
    end
  end

  def highest_calorie_meal
    recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date_created
    date = Time.now
    "#{date.month}-#{date.day}-#{date.year}"
  end
end