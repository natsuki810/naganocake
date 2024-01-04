class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  has_many :cart_items
  has_many :order_details

  def add_tax_price
     (price * 1.1).floor
  end

end
