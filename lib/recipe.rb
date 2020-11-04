class Recipe
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ingredients_required
    {}
  end
end
