class Pantry
  attr_reader :stock  # => nil

  def initialize
    @stock = Hash.new {|hash, key| hash[key] = 0}
  end                                              # => :initialize

  def stock_check(item)
    @stock[item]
  end                    # => :stock_check

  def restock(item, quantity)
    @stock[item] += quantity
  end                          # => :restock

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, quantity|
      require "pry"; binding.pry
      quantity >= stock_check(ingredient)
    end
  end                                                           # => :enough_ingredients_for?




end  # => :enough_ingredients_for?
