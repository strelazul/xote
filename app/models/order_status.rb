# Xote e-commerce
# Paloma Brandao

class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { within: 3..20 }
end
