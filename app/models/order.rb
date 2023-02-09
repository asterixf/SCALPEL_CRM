class Order < ApplicationRecord
  belongs_to :lead
  has_many :items
  has_many :products, through: :items
  has_many :onotes
end
