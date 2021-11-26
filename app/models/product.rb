# Xote e-commerce
# Paloma Brandao

class Product < ApplicationRecord
  belongs_to :category
  has_many :stocks
  has_many :orders, through: :carts

  validates :name, presence: true, length: { within: 3..20 }
  validates :price, numericality: { greater_than: 0 }
  validates :alcohol, inclusion: [true, false]
end
