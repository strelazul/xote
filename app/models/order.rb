# Xote e-commerce
# Paloma Brandao

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :order_status
  has_many :products, through: :carts
  has_many :carts

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :carts, allow_destroy: true
end
