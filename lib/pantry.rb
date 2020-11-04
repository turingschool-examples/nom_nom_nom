class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new { |stock, ingredient| stock[ingredient] = 0 }
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, qty)
    @stock[ingredient] += qty
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, qty|
      stock_check(ingredient) >= qty
    end
  end
end
