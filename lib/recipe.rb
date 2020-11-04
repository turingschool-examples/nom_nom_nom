class Recipe 
  attr_reader :name,
              :ingredients_required
  
  def initialize(name)
    @name                 = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, qty)
    if @ingredients_required[ingredient]
      @ingredients_required[ingredient] += qty
    else
      @ingredients_required[ingredient] = qty
    end 
  end

  def ingredients 
    @ingredients_required.keys
  end
end