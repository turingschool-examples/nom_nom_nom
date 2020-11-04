class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
      stock[ingredient]
  end

  def restock(ingredient, count)
      stock[ingredient] += count
  end

  def enough_ingredients_for?(recipe)
    @stock.none? do |ingredient, value|
      recipe.needed[ingredient] < value
    end
  end

end
