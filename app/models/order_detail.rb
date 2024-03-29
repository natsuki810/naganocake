class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: { impossible: 0, waiting: 1, production: 2, complete: 3 }
end
