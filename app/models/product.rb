class Product < ApplicationRecord

  def product_label
    "#{name} - #{price}"
  end
end
