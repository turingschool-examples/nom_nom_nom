require 'date'

class CookBook
  attr_reader :recipes,
              :date

  def initialize
    @recipes = []
    @date = Date.today
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end


  def summary
    @recipes.map do |recipe|
      breakdown = {}
      breakdown[:name] = recipe.name
      breakdown[:details] = {ingredients: []}
      recipe.ingredients_required.each do |ingredient, qty|
        breakdown[:details][:ingredients] << {ingredient: ingredient.name, amount: "#{qty} #{ingredient.unit}"}
      end
      breakdown[:total_calories] = recipe.total_calories
      breakdown[:details][:ingredients].sort_by { |ingredient| ingredient[:amount].to_i }.reverse
      breakdown
    end
  end
end
