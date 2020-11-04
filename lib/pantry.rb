class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if !stock[ingredient]
      stock[ingredient] = 0
    end
    stock[ingredient]
  end

  def restock(ingredient, count)
    if stock[ingredient]
      stock[ingredient] += count
    else
      stock[ingredient] = count
    end
  end

end
