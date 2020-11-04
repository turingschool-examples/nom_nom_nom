class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
    recipe.ingredients.each do |ingredient|
      @ingredients << ingredient.name
    end
  end

  def recipes
    @recipes.uniq
  end

  def ingredients
    @ingredients.flatten.uniq
  end

  def highest_calorie_meal
    highest = @recipe.max_by do |recipe|
      recipe.total_calories
    end
    highest
  end
end
