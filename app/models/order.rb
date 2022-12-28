class Order < ApplicationRecord
  belongs_to :lead
  has_many :items
  has_many :products, through: :items
end
