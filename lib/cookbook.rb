class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_array = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient, amount|
        ingredients_array << ingredient.name
      end
    end
    ingredients_array.uniq
  end
end