class Recipe
  attr_reader :name

  def initialize(name)
    @name = name
    @needed = Hash.new(0)
  end

  def ingredients_required
    @needed
  end

  def add_ingredient(ingredient, quantity)
    ingredients_required[ingredient] += quantity
  end

  def ingredients
    @needed.keys
  end
end
