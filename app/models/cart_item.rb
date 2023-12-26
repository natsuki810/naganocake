class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  def subtotal
    amount*item.add_tax_price
  end
  

end
