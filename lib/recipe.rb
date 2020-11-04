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
end
