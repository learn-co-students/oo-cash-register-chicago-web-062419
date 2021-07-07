require "pry"

class CashRegister

    attr_accessor :add_item, :apply_discount, :total, :items, :price_each, :discount

    #this will keep track of all your shopping everytime something has been added
    #when you arrive at the shopping til your amount is empty and your discount is automatically set as 20%
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @price_each = []
    end 
#Everytime you add an item it has 3 properties. 
#We want to keep track of the total and add each item to the total
#For the quantity specified, we want to create a loop that will add an item for the number of 
# times that the quantity correlates to. We want to add this to our cart so we can keep track of our purchases
#We also want a matching array of just price
    def add_item(title, price, quantity = 1)
        self.total += price*quantity 
            quantity.times do
            @items << title 
            end 
            quantity.times do 
            @price_each << price
            end 
    end 
#if we didnt set a discount then return no discount
#else calculate the after discount total
    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            cart_total = self.total
             discount_amount = 100 - @discount
             @total = cart_total * discount_amount/100
        return "After the discount, the total comes to $#{total}." #did not need to include the @ when referring to the instance variable total 
        end 
    end

#using the array of prices, we want to subtract the last item that we added from the total.
#I used -=, because we need to alter self total. 
    def void_last_transaction
        self.total -= @price_each.last
    end 

end 

# grace = CashRegister.new

# grace.add_item("banana",1000)

# grace.apply_discount


# grace.void_last_transaction