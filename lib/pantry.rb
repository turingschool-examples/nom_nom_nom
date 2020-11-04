class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if stock[ingredient]
      stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, amount)
    if stock[ingredient]
      stock[ingredient] += amount
    else
      stock[ingredient] = amount
    end
  end

  def enough_ingredients_for?(recipe)
    is_true = true
    recipe.ingredients_required.each_pair do |ingredient, amount|
      if @stock[ingredient] && @stock[ingredient] >= amount
      else
        is_true = false
      end
    end
    is_true
  end
end