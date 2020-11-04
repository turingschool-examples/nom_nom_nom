class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item_obj)
    if @stock[item_obj].nil?
      0
    else
      @stock[item_obj]
    end
  end

  
end
