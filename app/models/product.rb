class Product < ApplicationRecord
  has_many :items
  has_many :orders, through: :items
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  def product_label
    "#{id}-#{name} - $#{price}"
  end
end
