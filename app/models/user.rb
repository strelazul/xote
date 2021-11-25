# Xote e-commerce
# Paloma Brandao

class User < ApplicationRecord
  belongs_to :customer

  validates :login, presence: true, length: { within: 3..20 }
  validates :password, presence: true, length: { within: 8..40 }
end
