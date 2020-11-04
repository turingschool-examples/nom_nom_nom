class Recipe
  attr_reader :name

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient
  end
end
