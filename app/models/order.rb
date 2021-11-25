# Xote e-commerce
# Paloma Brandao

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  belongs_to :order_status
  has_many :products, through: :carts
end
