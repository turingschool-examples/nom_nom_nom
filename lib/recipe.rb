class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient_obj, amount)
    @ingredients_required[ingredient_obj] ||= 0
    @ingredients_required[ingredient_obj] += amount
  end

  def ingredients
    @ingredients_required.keys
  end
end