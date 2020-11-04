class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amt)
    @stock[ingredient] += amt
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amt|
      stock[ingredient] >= amt
    end
  end
end
