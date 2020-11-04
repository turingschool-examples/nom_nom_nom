class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new { |ing_req, ing| ing_req[ing] = 0 }
  end

  def add_ingredient(ingredient, qty)
    @ingredients_required[ingredient] += qty
  end

  def ingredients
    @ingredients_required.map do |ingredient, qty|
      ingredient
    end
  end

  def total_calories
    @ingredients_required.sum do |ingredient, qty|
      qty * ingredient.calories
    end
  end
end
