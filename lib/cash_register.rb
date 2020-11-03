require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
    @last_item = nil
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_transaction = price
    @last_item = title
    quantity.times { |_x| @items << title }
  end

  def apply_discount
    return 'There is no discount to apply.' if @discount.zero?

    @total -= (@discount * @total * 0.01).to_i
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @items = @items.filter { |item| item != last_item }
    @items.empty? ? @total = 0.0 : @total -= @last_transaction
  end
end
