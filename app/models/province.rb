class Province < ApplicationRecord
  has_many :cities

  validates :name, presence: true, length: { within: 3..20 }
  validates :gst, numericality: { greater_than_or_euqal_to: 0 }
  validates :pst, numericality: { greater_than_or_euqal_to: 0 }
  validates :hst, numericality: { greater_than_or_euqal_to: 0 }
end
