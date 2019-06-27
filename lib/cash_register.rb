class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
       @total = 0
       @items = []
       @last_transaction = 0

    end

    

    def add_item(title, price, quantity = 1)
        
         self.total += price * quantity
         quantity.times do
            items << title
          end
          self.last_transaction = price * quantity

    end

    def apply_discount
        if self.discount != 0
            return "After the discount, the total comes to $#{self.total -= total * discount/100}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end


end
