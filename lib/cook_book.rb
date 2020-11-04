class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe_obj)
    @recipes << recipe_obj
  end
end
