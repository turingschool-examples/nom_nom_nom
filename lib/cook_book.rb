class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = format_time(Time.new)
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories.to_i
    end
  end

  def format_time(time)
    day = time.day.to_s.rjust(2, '0')
    month = time.month.to_s
    year = time.year.to_s
    month + "-" + day + "-" + year
  end

  def summary
    #[{:name=>"Mac and Cheese",
      #:details=>{:ingredients=>[
        #{:ingredient=>"Macaroni", :amount=>"8 oz"},
        #{:ingredient=>"Cheese", :amount=>"2 C"}
      #],
      #:total_calories=>440}
    @recipes.each do |recipe|
      {
        name: recipe.name,
        total_calories: recipe.total_calories,
        detais: get_details(recipe)
      }
    end
  end

  def get_details(recipe)
    return_arr = []
    recipe.ingredients_required.each do |ingredient,amount|
      return_arr << {
        ingredient: ingredient,
        amount: amount
      }
    end
  end
end
