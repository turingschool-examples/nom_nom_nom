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
    check_array = recipe.ingredients_required.map do |req_item, req_amount|
      @stock.map do |ingredient, amount|
        stock_check(req_item) >= req_amount
      end
    end
    check_array.flatten.none?(false)
  end
end
