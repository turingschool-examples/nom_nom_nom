require './lib/ingredient'

class Pantry
  attr_reader :ingredients

  def initialize
    @ingredients = []
  end

  def stock
    {}
  end

  def stock_check(ingredient)
    if @ingredients.include?(ingredient)
      @ingredients
    else
      0
    end
  end

  def restock(ingredient, amount)
    ingredient = Ingredient.new({
                                name: @name,
                                unit: @unit,
                                calories: @calories})
    @ingredients << ingredient
    ingredient
    require "pry"; binding.pry
  end
end
