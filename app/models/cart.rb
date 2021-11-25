# Xote e-commerce
# Paloma Brandao

class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_euqal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than: 0 }
  validates :tax, numericality: { greater_than: 0 }
end
