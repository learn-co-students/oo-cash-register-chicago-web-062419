require 'pry'

# class is an object with instructions for the behaviors of it's instances. 

class CashRegister
    # attr_accessor includes reader/getter (returns info stored in an instance variable)
    #  and writer/setter (makes code writable? you can act on that varbiable may be a better way of saying it?)- for instance variables, makes their scope accesible inside of the class. 
    attr_accessor :total, :discount, :items, :last_item
      
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end 

    # what is ::new ? :/  Class Method(do things)?  v. Instance methods(do things?)
# instance method - each time an item is added to the register they can act on the register
    # by using self, I am telling the instance method to act on itself? self is total. 
    # originally had quantity=0 as a default arg, but the tests werent passing why? 
    # I thought you werent entitled to buy anything in the store. 
    def add_item(title, price, quantity=1)
        self.total += price * quantity
        # for each item that is added, it needs to go into the items array, 
        # which needs to use a loop so that all of them get in there.
        quantity.times do 
        items << title 
        end 
        self.last_item = price * quantity
    end 

    def apply_discount
        if discount != 0
            @total -= @total * @discount / 100
            return "After the discount, the total comes to $#{total}."
        else
            return "There is no discount to apply."

        end 
    end 

    def void_last_transaction
        self.total -= self.last_item
end 
end 

