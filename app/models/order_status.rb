class OrderStatus < ApplicationRecord
  has_many :orders

  validates :name, presence: true, length: { within: 3..20 }
end
