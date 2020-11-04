class CookBook
  attr_reader :recipes 

  def initialize 
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients 
    @recipes.map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.flatten.uniq
  end

  def highest_calorie_meal
    recipes = Hash.new(0)
    @recipes.map do |recipe|
      recipe.ingredients.max_by do |ingredient|
        ingredient.calories 
      end 
    end 
  end
end