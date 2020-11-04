class CookBook
    attr_reader :recipes, :date

    def initialize
        @recipes = []
        @date = date
    end

    def add_recipe(recipe)
        @recipes << recipe
    end

    def ingredients
        @recipes.map do |recipe|
            recipe.ingredients.map do |ingredient|
                ingredient.name
            end
        end.flatten.uniq
    end

    def highest_calorie_meal
        @recipes.max_by do |recipe|
            recipe.total_calories
        end
    end

    def date
        DateTime.now.strftime("%m-%d-%Y")
    end

    def summary
        summ = []
        @recipes.each do |recipe|
            breakdown = {}
            breakdown[:name] = recipe.name
            breakdown[:details] = {
                ingredients: recipe.ingredients.map do |ingredient|
                    {ingredient: ingredient.name, amount: "#{recipe.ingredients_required[ingredient]} #{ingredient.unit}"}
                end ,
                total_calories: recipe.total_calories
            }
            summ << breakdown
        end
        summ
    end
end