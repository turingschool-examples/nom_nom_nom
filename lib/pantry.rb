class Ingredient
    attr_reader :name, :unit, :calories

    def initialize(description)
        @name = description[:name]
        @unit = description[:unit]
        @calories = description[:calories]
    end
end