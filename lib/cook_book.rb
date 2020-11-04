class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    all_ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient_required, quantity|
        all_ingredients << ingredient_required.name 
      end
    end
    all_ingredients.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end