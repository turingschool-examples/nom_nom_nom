class Recipe
  attr_reader :name, :ingredients_required, :total_calories

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
    @total_calories = 0
  end

  def calculate_calories(ingredient, amount)
    @total_calories += (ingredient.calories * amount)
  end

  def store_required_ingredients(ingredient)
    @ingredients << ingredient
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required.keys.include?(ingredient) == false
      @ingredients_required[ingredient] = amount
    else
      new_stock = {ingredient => amount}
      @ingredients_required.merge!(new_stock) do |key, old, new|
        old + new
      end
    end
    calculate_calories(ingredient, amount)
    store_required_ingredients(ingredient)
  end

  def ingredients
    @ingredients.uniq
  end
end
