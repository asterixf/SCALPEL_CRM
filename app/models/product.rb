class Product < ApplicationRecord
  has_many :items
  has_many :orders, through: :items
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_one_attached :photo

  def product_label
    "#{id}-#{name} - $#{price}"
  end
end
