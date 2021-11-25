# Xote e-commerce
# Paloma Brandao

class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
end
