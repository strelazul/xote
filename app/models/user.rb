# Xote e-commerce
# Paloma Brandao

class User < ApplicationRecord
  has_one :user
  has_many :orders
  has_many :addresses

  validates :name, presence: true, length: { within: 5..20 }
  validates :birthday, presence: true
  validates :login, presence: true, length: { within: 3..20 }
  validates :password, presence: true, length: { within: 8..40 }
  validates :email, presence: true
end
