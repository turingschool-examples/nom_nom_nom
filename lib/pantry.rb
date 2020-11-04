class Pantry

    attr_reader :stock, :stock_check

    def initialize
        @stock = Hash.new(0)
        @stock_check = 0
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
end