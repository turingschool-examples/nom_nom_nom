class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe_obj)
    @recipes << recipe_obj
  end

  def ingredients
    ingredient_names = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient_obj, quantity_req_int|
        ingredient_names << ingredient_obj.name
      end
    end
    ingredient_names.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
      end
  end

  def recipe_by_calorie
    breakdown = {}
    @recipes.each do |recipe_obj|
      breakdown[recipe_obj] = recipe_obj.total_calories
    end
    breakdown
  end

#nested iteration
# access to ingredient obj's via recipe_obj
# populate nested hash
# shovel hash into array
  def summary
    breakdown = []
    recipe_by_calorie.each do |recipe_obj, calories_int|
      require "pry"; binding.pry
    end
  end

end
