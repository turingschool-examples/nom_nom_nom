class Recipe
  attr_reader :name, :needed

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

  def total_calories
    @needed.sum do |need, quantity|
      need.calories * quantity
    end
  end


end
