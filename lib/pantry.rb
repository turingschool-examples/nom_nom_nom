class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def restock(ingredient,amount)
    @stock[ingredient] ||= 0
    @stock[ingredient] += amount
  end
end
