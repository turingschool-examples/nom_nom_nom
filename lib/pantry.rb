class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, amount)
    if @stock.keys.include?(ingredient) == false
      @stock[ingredient] = amount
    else
      new_stock = {ingredient => amount}
      @stock.merge!(new_stock) do |key, old, new|
        old + new
      end
    end
  end
end
