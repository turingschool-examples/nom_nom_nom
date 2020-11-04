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
end