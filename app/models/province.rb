# Xote e-commerce
# Paloma Brandao

class Province < ApplicationRecord
  has_many :cities, dependent: :destroy

  validates :name, presence: true, length: { within: 3..25 }
  validates :gst, numericality: { greater_than_or_euqal_to: 0 }
  validates :pst, numericality: { greater_than_or_euqal_to: 0 }
  validates :hst, numericality: { greater_than_or_euqal_to: 0 }
end
