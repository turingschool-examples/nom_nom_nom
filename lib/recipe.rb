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

    def total_calories
        total_cal = 0
        @ingredients_required.each do |ingredient|
            cals = ingredient[0].calories * @ingredients_required[ingredient[0]]
            total_cal += cals
        end
        total_cal
    end
end
