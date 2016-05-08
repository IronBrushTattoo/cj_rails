class Label

  def initialize(gauge, size, desc, id, price, updated)
    @gauge = gauge
    @size = size
    @desc = desc
    @id = id
    @price = price
    @updated = updated
  end

  attr_reader :gauge, :size, :desc, :id, :price, :supply, :updated

end
