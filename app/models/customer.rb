class Customer < ApplicationRecord
  has_one :user
  has_many :orders
  has_many :addresses

  validates :name, presence: true, length: { within: 5..20 }
  validates :birthday, presence: true
  validates :email, presence: true
end
