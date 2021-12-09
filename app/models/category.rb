# Xote e-commerce
# Paloma Brandao

class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
