class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new {|hash, key| hash[key] = 0}
  end

  def stock_check(item_obj)
    if @stock[item_obj].nil?
      0
    else
      @stock[item_obj]
    end
  end

  def restock(ingredient_obj, quantity_int)
    @stock[ingredient_obj] += quantity_int
  end

  def enough_ingredients_for?(recipe_obj)
      recipe_obj.ingredients_required.all? do |ingredient_obj, quantity_req_int|
        @stock[ingredient_obj] >= quantity_req_int
      end
  end

end
