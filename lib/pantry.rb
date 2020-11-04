class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new {|hash, key| hash[key] = 0}
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, quantity|
      quantity >= stock_check(ingredient)
    end
  end




end