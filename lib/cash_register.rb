class CashRegister
  attr_accessor :total, :discount, :items, :last_added

  def initialize(discount = 0) #sets @total to zero OR takes an employee discount as an arugment of the value (20)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1) #accepts an item and it's price (and optionally it's quantity) and increases total
    self.total += price * quantity
    quantity.times do
      @items << item
    end
    self.last_added = price * quantity
  end

  def apply_discount #if register was initialized with discount removes discount% from total and returns either a success message or fail message
    if discount != 0
      percent_off = (100 - @discount.to_f) / 100
      self.total = (@total * percent_off).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction #removes the last item and subtracts its price from the total. If no items remain returns 0.0
    self.total -= self.last_added
  end

end
