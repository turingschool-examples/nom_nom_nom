class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient_query)
    @stock[ingredient_query]
  end

  def restock(ingredient, amount)
    @stock[ingredient] ||= 0
    @stock[ingredient] += amount
  end
end