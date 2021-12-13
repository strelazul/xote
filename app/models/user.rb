# Xote e-commerce
# Paloma Brandao

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :first_name, presence: true, length: { within: 2..20 }
  validates :last_name, presence: true, length: { within: 2..50 }
  validates :email, presence: true
end
