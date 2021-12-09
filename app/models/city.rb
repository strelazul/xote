# Xote e-commerce
# Paloma Brandao

class City < ApplicationRecord
  belongs_to :province
  has_many :addresses, dependent: :destroy

  validates :name, presence: true, length: { within: 2..50 }
end
