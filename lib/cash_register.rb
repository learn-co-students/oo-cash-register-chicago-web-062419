require "pry"

class CashRegister
    attr_reader :title, :all_items, :price 
    attr_accessor :discount, :total, :last_transaction

    @total = 0
    @items = []

    def initialize(discount = 0, total = 0)
        @total = total
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        @total = self.total + price * quantity
        @title = title
        @price = price
        @quantity = quantity
        # .times was a new method to the method menu.
        quantity.times do 
            @items << title
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount == 0
            p "There is no discount to apply."
        else 
            @total = @total * (1 - (@discount * 0.01))
            p "After the discount, the total comes to $#{@total.ceil}."
        end
    end

    def items
        p @items
    end

    def void_last_transaction
        # I definitely needed help on this one. Should have been so simple but the logic escaped me. 
        self.total = self.total - self.last_transaction
    end
end




# Scratch code:
# p cash_register = CashRegister.new
# p cash_register.total
# p cash_register.add_item("book", 5.00, 3)
# p cash_register.total
# p cash_register.add_item("eggs", 0.98)
# p cash_register.total

# p discounted_cash_register = CashRegister.new(20)
# p discounted_cash_register.add_item("laptop", 1000, 1)
# p discounted_cash_register.apply_discount
# p discounted_cash_register.items



