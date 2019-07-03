require "pry"
class CashRegister
    attr_accessor :total, :price, :quantity, :discount, :items
    
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=nil)
        if quantity == nil
            @total += price
            @items << title
        else
            @quantity = quantity
            total_price = price * quantity
            @total += total_price
            quantity.times { @items << title }
        end
    end
    
    def apply_discount
        if discount != nil
            @total = @total * (1 - (discount.to_f/100))
            p "After the discount, the total comes to $#{total.to_i}."
        else
            p "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        binding.pry
        @items.pop
        @total -= self.total
        
    end

end
