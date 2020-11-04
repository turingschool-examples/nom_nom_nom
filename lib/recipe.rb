class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new {|hash, key| hash[key] = 0}
  end

  def add_ingredient(ingredient_obj, quantity_req_int)
    @ingredients_required[ingredient_obj] += quantity_req_int
  end

  def ingredients
    @ingredients_required.keys
  end



end
