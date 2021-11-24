class Product < ApplicationRecord
  belongs_to :category
  has_many :stocks
  has_many :orders, through: :carts
end
