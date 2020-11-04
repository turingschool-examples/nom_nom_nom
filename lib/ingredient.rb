class Ingredient
  # attr_reader

  def initialize(data)
    @name = data[:name]
    @unit = data[:unit]
    @calories = data[:calories]
  end

end
