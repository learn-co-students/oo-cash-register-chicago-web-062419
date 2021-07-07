
require 'pry'

class CashRegister

    attr_accessor :discount, :item, :price, :quantity, :last
    attr_reader :total

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        # binding.pry
    end

    def total= (total)
        @total = total
    end

    def add_item (item, price, quantity = 1)
        self.total += (price * quantity)     
        quantity.times do 
            @items << item
        end
        @last = price * quantity
    end

    def apply_discount
        # binding.pry
        if self.discount != 0
            self.total = (self.total - (self.discount / 100.0 * self.total))
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last
    end




end
