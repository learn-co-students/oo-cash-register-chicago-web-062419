require 'pry'
class CashRegister

    attr_accessor :total, :discount, :quantity, :last
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount.to_f
        @items = []
    end

    def total
        @total.to_f
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do 
            @items << title
        end
        @last = price * quantity
    end

    def apply_discount
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