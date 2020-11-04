class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
      @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    true_false = recipe.ingredients_required.map do |ingredient, amount|
      if !@stock.include?(ingredient)
        false
      elsif stock_check(ingredient) >= amount
        true
      else
        false
      end
    end
      if true_false.include?(false)
      false
    else
      true
    end
  end 
end
