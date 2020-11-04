
class CookBook
  attr_reader :recipes, :ingredients

  def initialize
    @recipes = []
    @ingredients = []
    @date = Date.today
  end

  def add_recipe(recipe)
    @recipes << recipe
    add_ingredient
  end

  def add_ingredient
    @recipes.map do |recipe|
    recipe.ingredients.each do |ingredient|
      if !@ingredients.include?(ingredient.name)
        @ingredients << ingredient.name
        end
      end
    end
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def summary
    final = []
    @recipes.each do |recipe|
      inside_hash_info = {}
      inside_hash_info[:name] = recipe.name
      details = {}
      details[:total_calories] = recipe.total_calories
      details[:ingredients] = []
      ingredients = recipe.ingredients_required
      ingredients.each_pair do |ingredient, quantity|
        ingredient_info = {}
        ingredient_info[:ingredient] = ingredient.name
        ingredient_info[:amount] = "#{quantity} #{ingredient.unit}"
        details[:ingredients] << ingredient_info
      end
      inside_hash_info[:details] = details
      final << inside_hash_info
    end
    final
  end
end
