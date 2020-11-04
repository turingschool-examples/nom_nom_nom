class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    names = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        names << ingredient.name
      end
    end
    names.uniq
  end

  def highest_calories_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

end
