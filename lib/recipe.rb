class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new{|hash,key|hash[key] = 0}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end
end
