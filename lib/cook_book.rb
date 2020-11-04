class CookBook
attr_reader :recipes,
            :date

  def initialize
    @recipes = []
    @date = Time.now.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
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

  def ingredients_details
    breakdown = Hash.new
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient, amount|
      breakdown[:ingredient] = ingredient.name
      breakdown[:amount] = "#{amount}#{ingredient.unit}"
      end
    end
    breakdown
  end

  def summary

  end

end
