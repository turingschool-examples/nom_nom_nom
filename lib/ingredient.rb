class Ingredient

  attr_reader  :name,
                :unit,
                :calories

  def initialize(arg)
    @name = arg[:name]
    @unit = arg[:unit]
    @calories = arg[:calories]
  end
end
