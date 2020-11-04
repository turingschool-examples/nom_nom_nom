class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    @stock.count
  end

  def restock(ingredient_obj, quantity)
    @stock[ingredient_obj] = quantity
  end
end
