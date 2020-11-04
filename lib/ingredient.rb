class Ingredient
  attr_reader :name, :unit, :calories
  def initialize(hash)
    @name = hash[:name]
    @unit = hash[:unit]
    @calories = hash[:calories]
  end
end