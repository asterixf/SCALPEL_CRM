class Product < ApplicationRecord
  has_many :items
  has_many :orders, through: :items

  def product_label
    "#{id}-#{name} - $#{price}"
  end
end
