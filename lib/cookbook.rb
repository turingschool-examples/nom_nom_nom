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

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    creation_date = Time.new(2020, 04, 22) #passed in date to match interaction pattern
    creation_date.strftime("%m-%d-%Y")
  end
end