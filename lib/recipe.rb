class Recipe
  attr_reader :name,
              :ingredients_required
              
   
  def initialize(name)
    @name = name 
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredients, quantity)
    @ingredients_required[ingredients] += quantity
  end

  def ingredients
    @ingredients_required.map do |ingredient, quantity|
      ingredient
    end.flatten
  end 

  def total_calories
    @ingredients_required.sum do |ingredient, quantity|
      ingredient.calories * quantity
    end
  end
end