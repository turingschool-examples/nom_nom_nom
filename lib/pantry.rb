require './lib/ingredient'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end
end
