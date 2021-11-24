class City < ApplicationRecord
  belongs_to :province
  has_many :addresses

  validates :name, presence: ture, length: {witin: 2..50}
end
