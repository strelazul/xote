class Stock < ApplicationRecord
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_euqal_to: 0, only_integer: true }
  validates :made_on, presence: true
  validates :durable_life, numericality: { greater_than: 0, only_integer: true }
end
