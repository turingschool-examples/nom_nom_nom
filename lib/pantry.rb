class Pantry

    attr_reader :stock

    def initialize
        @stock = Hash.new(0)
    end
    
    def restock(ingredient, qty)
        @stock[ingredient] += qty
    end

    def stock_check(ingredient = "")
        if ingredient == ""
            if @stock.values.inject(:+) == nil
                0
            else 
                @stock.values.inject(:+)
            end
        else
            @stock[ingredient]
        end
    end

    def enough_ingredients_for?(recipe)
        @stock.all? do |ingredient|
            ingredient[1] >= recipe.ingredients_required[ingredient[0]]
        end
    end
end