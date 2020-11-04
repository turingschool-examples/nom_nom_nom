class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe_obj)
    @recipes << recipe_obj
  end

  def ingredients
    @recipes.map do |recipe|
      recipe.ingredients_required.map do |ingredient|
        ingredient[0].name
      end
    end.flatten.uniq
  end

  def highest_calorie_meal
    group_recipes_by_calories.key(group_recipes_by_calories.values.max)
  end

  def group_recipes_by_calories
    recipe_obj_calores = {}
    @recipes.each do |recipe|
      recipe_obj_calores[recipe] = recipe.total_calories
    end
    recipe_obj_calores
  end
end
