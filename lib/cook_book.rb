class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    list = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        list << ingredient.name
      end
    end
    list.uniq
  end
end
