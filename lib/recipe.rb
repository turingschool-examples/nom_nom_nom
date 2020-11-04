class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if ingredients_required[ingredient]
      ingredients_required[ingredient] += amount
    else
      ingredients_required[ingredient] = amount
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total = 0
    ingredients_required.each_pair do |ingredient, amount|
      total += ingredient.calories * amount
    end
    total
  end

  def ingredient_names
    ingredients.flat_map do |ingredient|
      ingredient.name
    end
  end

  def summary
    # So close, but my eyes are crossing. shouldve started with many methods.
    recipe_summary = {}
    recipe_summary[:name] = @name
    details = {}
    details[:ingredients] = []
    ingredients_required.each_pair do |ingredient, amount|
      ingredient_deets = {
        ingredient: ingredient.name,
        amount: "#{amount} #{ingredient.unit}"
      }
      details[:ingredients] << ingredient_deets
      # require 'pry';binding.pry
      details[:ingredients].sort_by! do |thing|
        (ingredient.calories * amount)
      end
    end
    details[:total_calories] = total_calories
    recipe_summary[:details] = details
    recipe_summary
  end
end