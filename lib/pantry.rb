class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    if @stock[ingredient] ||= amount
      @stock[ingredient] += amount
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amount|
      recipe.ingredients_required[ingredient] <= stock[ingredient]
    # stock.all? do |ingredient, amount|
    #   stock[ingredient] >= recipe.ingredients_required[ingredient]
    end
  end
end