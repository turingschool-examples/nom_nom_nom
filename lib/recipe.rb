class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new{|hash,key|hash[key] = 0}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end
<<<<<<< HEAD
=======

  def total_calories
    ingredients.sum do |ingredient|
      ingredient.calories.to_i * @ingredients_required[ingredient]
    end
  end
>>>>>>> iteration_3
end
