class CookBook
  attr_reader :recipes, :date_made

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredient_names
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    @date_made = Time.new
    values = @date_made.to_a
    if values[4].to_s.length == 1
      values[4] = "0" + values[4].to_s
    end
    if values[3].to_s.length == 1
      values[3] = "0" + values[3].to_s
    end
    "#{values[3]}-#{values[4]}-#{values[5]}"
  end
end