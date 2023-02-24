class Item < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :product, presence: true
  # validates :quantity, presence: true
  validates :quantity, comparison: { greater_than: 0 }
  validate :existing_product_in_order

  def price_total
    if product
      (product.price * quantity).round(2)
    else
      0.0
    end
  end

  private

  def existing_product_in_order
    if order.items.where.not(id: id).map(&:product_id).include?(product_id)
      errors.add(product.name, "already exists in the order")
    end
  end
end
