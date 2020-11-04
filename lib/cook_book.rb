require 'date'

class CookBook
  attr_reader :recipes,
              :date

  def initialize
   @recipes = []
   @date = Date.today
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients 
    @recipes.each_with_object([]) do |recipe, names|
      recipe.ingredients_required.each do |ingredient, qty|
        names << ingredient.name 
      end
    end.uniq
  end

  def highest_calorie_meal
      @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def summary
    breakdown = {}
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient, qty|
        breakdown[:name] = recipe.name
        breakdown[:details] = [{
                                :ingredient     = ingredient.name,
                                :amount         = "#{qty} #{ingredient.unit}"
                               },
                              {
                                :ingredient     = ingredient.name, 
                                :amount         = "#{qty} #{ingredient.unit}",
                                :total_calories = recipe.total_calories
                              }]
                              require 'pry'; binding.pry
      end 
    end
    breakdown
  end
end