class CookBook
  attr_reader:recipes
  def initialize
    @recipes =[]
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = []
    @recipes.each do |ingredient|
    ingredients <<  ingredient.name[ingredient] 
    end
  end
end
