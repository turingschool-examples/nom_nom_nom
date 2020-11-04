require './lib/recipe'

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

  def enough_ingredients_for?(recipe) #unfinished
    enough = []
    recipe.ingredients_required.each do |requirement|
      if requirement[recipe.ingredients] <= @stock[ingredient] == true
        enough << true
      end
    end
      if enough.all?(true)
      end
  end
end
