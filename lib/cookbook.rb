class CookBook
  attr_reader :recipes,
              :date

  def initialize
    @recipes = []
    @date = nil
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_needed = []
    @recipes.each do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredients_needed << ingredient.name
      end
    end
    (ingredients_needed).uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def add_date_created(date)
    @date = date
  end

# ingredients are listed in order
# of total_calories they contribute to a recipe
  def summary
    @recipes.map do |recipe|
      recipe.ingredients_required.sort_by do |ingredient, amt|
        ingredient.calories * amt
      end
    end
  end
end
