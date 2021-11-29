# Xote e-commerce
# Paloma Brandao

class Product < ApplicationRecord
  belongs_to :category
  has_many :stocks
  has_many :orders, through: :carts
  has_many :carts

  validates :name, presence: true, length: { within: 3..20 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :alcohol, inclusion: [true, false]
end
