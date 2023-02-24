class Order < ApplicationRecord
  belongs_to :lead
  has_many :items
  has_many :products, through: :items
  has_many :onotes

  def order_total
    if items.empty?
      return 0.00
    else
      items_price = items.map { |i| i.price_total }
      return items_price.inject(:+).round(2)
    end
  end
end
