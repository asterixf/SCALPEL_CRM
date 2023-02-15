class Item < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def price_total
    if product
      product.price * quantity
    else
      0.0
    end
  end
end
