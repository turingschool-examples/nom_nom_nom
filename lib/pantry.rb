class Pantry
attr_reader :stock

  def initialize
    @stock        = []
    @stock_amount = 0
  end

  def stock_check(ingredient)
      @stock_amount
  end

  def restock(ingredient, amount)
    @stock_amount += amount
  end

end
