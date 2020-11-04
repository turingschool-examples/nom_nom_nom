class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = format_time(Time.new)
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
      recipe.total_calories.to_i
    end
  end

  def format_time(time)
    day = time.day.to_s.rjust(2, '0')
    month = time.month.to_s
    year = time.year.to_s
    month + "-" + day + "-" + year
  end
end
