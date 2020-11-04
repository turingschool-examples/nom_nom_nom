class Recipe

    attr_reader :name, :ingredients_required

    def initialize(name)
        @name = name
        @ingredients_required = Hash.new(0)
    end

    def ingredients
        @ingredients_required.keys
    end

    def add_ingredient(ingredient, qty)
        @ingredients_required[ingredient] += qty
    end
    # `total_calories` method should 
    # sum the calories of each ingredient.
    #  The calories for each ingredient
    #   can be calculated by multiplying
    #    the `calories` attribute of the 
    #    Ingredient by the amount of the 
    #    ingredient required for the recipe.
end
