class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient_obj)
    if !@stock.include?(ingredient_obj)
      0
    else
      @stock[ingredient_obj]
    end
  end

  def restock(ingredient_obj, amount)
    if @stock.keys.include?(ingredient_obj)
      @stock[ingredient_obj] += amount
    else
      @stock[ingredient_obj] = amount
    end
  end
end
