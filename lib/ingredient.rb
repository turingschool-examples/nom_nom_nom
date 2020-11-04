class Ingredient
  attr_reader :name
  def initialize(ingredient_data)
    @name = ingredient_data[:name]

  end
end
