class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
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
end