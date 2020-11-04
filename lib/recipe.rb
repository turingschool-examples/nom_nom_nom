class Recipe

  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
      @ingredients_required[ingredient] += quantity
  end

  def ingredients
    ingredients_array = []
    ingredients_array.concat(ingredients_required.keys)
  end

  def total_calories
    result = 0
    @ingredients_required.keys.each do |ingredient|
      result += (ingredient.calories * @ingredients_required[ingredient])
    end
    result
  end
end
