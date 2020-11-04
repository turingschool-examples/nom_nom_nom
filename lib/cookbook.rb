class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def recipes
    @recipes.uniq
  end
end
