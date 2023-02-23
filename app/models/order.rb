class Order < ApplicationRecord
  belongs_to :lead
  has_many :items
  has_many :products, through: :items
  has_many :onotes

  def order_total
    items_price = items.map { |i| i.price_total }
    items_price.inject(:+).round(2)
  end
end
