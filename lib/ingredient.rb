class Ingredient
  attr_reader :name, :unit, :calories
  def initialize(input_hash)
    @name = input_hash[:name]
    @unit = input_hash[:unit]
    @calories = input_hash[:calories].to_s
  end
end
