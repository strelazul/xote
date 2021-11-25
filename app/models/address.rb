# Xote e-commerce
# Paloma Brandao

class Address < ApplicationRecord
  belongs_to :city
  has_many :orders

  validates :line01, presence: true, length: { within: 8..50 }
  validates :line02, length: { within: 0..50 }
  validates :postal_code, presence: true, length: { is: 6 }
end
