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
end