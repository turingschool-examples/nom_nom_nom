require './lib/ingredient'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |req_item, req_amount|
      @stock.all? do |ingredient, amount|
        stock_check(req_item) >= req_amount
      end
    end
  end
end
