# Xote e-commerce
# Paloma Brandao

class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :first_name, presence: true, length: { within: 5..20 }
  validates :last_name, presence: true, length: { within: 5..50 }
  validates :birthday, presence: true
  validates :login, presence: true, length: { within: 3..20 }
  validates :password, presence: true, length: { within: 8..40 }
  validates :email, presence: true
end
