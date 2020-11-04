class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredients(ingredient, amount)
    if ingredients_required.key?(ingredient)
      ingredients_required[ingredient] += amount
    elsif ingredient.class == Ingredient
      ingredients_required[ingredient] = amount
    end
  end

  def ingredients
    ingredients_required.map do |ingredient, amount|
      ingredient
    end
  end
end