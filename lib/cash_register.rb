require "pry"

class CashRegister
  attr_accessor :total, :discount, :last_item

  # https://www.rubyguides.com/2018/06/rubys-method-arguments/
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    # @cart = []
    @items = []
  end

  # Totes doesn't work
  # def initialize(total = 0, discount = 0)
  #     @total = total
  #     @discount = discount
  # end

  # setter
  def discount=(amount)
    @discount = amount
  end

  # getter
  def discount
    @discount
  end

  def items
    @items
  end

  def add_item(title, price, quantity = 1)
    # item_array = []
    @total += price * quantity
    quantity.times do
      @items << title
    end
    @last_item = price * quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    return "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    # Remove the last item's price from the total cost
    @total -= @last_item
  end

end
