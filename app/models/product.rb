# Xote e-commerce
# Paloma Brandao

class Product < ApplicationRecord
  belongs_to :category
  has_many :stocks, dependent: :destroy
  has_many :orders, through: :carts
  has_many :carts, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length: { within: 3..60 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :alcohol, inclusion: [true, false]

  scope :new_products, -> { where("created_at >= ?", 3.days.ago) }
  scope :sale, -> { where(on_sale: true) }
  scope :search_products, lambda { |search_words|
                   where("name LIKE ? OR description LIKE ?", "%#{sanitize_sql_like(search_words)}%", "%#{sanitize_sql_like(search_words)}%")
                 }
end
