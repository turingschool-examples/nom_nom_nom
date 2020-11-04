class Pantry
attr_reader :stock

  def initialize
    @stock        = []
    @stock_amount = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock_amount[ingredient]
  end

  def restock(ingredient, amount)
    @stock_amount[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    @stock_amount.all? do |ingredient, amount|
      recipe.ingredients_required.all? do |name, count|
        return true if amount >= count
      end
    end
  end
end
