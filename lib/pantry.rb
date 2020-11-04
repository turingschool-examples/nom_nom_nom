class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if stock.key?(ingredient)
      stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, amount)
    if stock.key?(ingredient)
      stock[ingredient] += amount
    elsif ingredient.class == Ingredient
      stock[ingredient] = amount
    else
      "Invalid ingredient!"
    end

  end
end