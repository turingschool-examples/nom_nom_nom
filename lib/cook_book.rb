class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients_required.flat_map do |ingredient, qty|
        ingredient.name
      end
    end.uniq
  end
end
