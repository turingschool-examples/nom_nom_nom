class Pantry
attr_reader :stock

  def initialize
    @stock        = []
    @stock_amount = Hash.new(0)
  end

  def stock_check(ingredient)
      @stock_amount[ingredient]
  end

  def restock(ingredient, amount)
    @stock_amount[ingredient] += amount
  end

end
