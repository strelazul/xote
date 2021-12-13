# Xote e-commerce
# Paloma Brandao

class Address < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :province, presence: true
end
