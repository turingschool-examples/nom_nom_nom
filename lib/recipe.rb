class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required.keys.include?(ingredient) == false
      @ingredients_required[ingredient] = amount
    else
      new_stock = {ingredient => amount}
      @ingredients_required.merge!(new_stock) do |key, old, new|
        old + new
      end
    end
    @ingredients << ingredient
  end

  def ingredients
    @ingredients.uniq
  end
end
