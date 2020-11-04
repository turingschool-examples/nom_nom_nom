class Recipe
    attr_reader :name,
                :ingredients_required

    def initialize(name)
        @name                 = name
        @ingredients_required = {}
    end

    def add_ingredient(ingredient, quantity)
        if @ingredients_required[ingredient]
            @ingredients_required[ingredient] += quantity
        else 
            @ingredients_required[ingredient] = quantity
        end
    end

    def ingredients
        noms = []
        @ingredients_required.each do |ingredient, quantity|
            noms << ingredient
        end
        noms.flatten
    end

    def total_calories
        total = 0
        @ingredients_required.each do |ingredient, quantity|
            total += ingredient.calories * quantity
        end
        total
    end
end