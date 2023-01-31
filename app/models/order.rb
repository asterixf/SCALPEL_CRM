class Order < ApplicationRecord
  belongs_to :lead
  belongs_to :customer
  has_many :items
  has_many :products, through: :items
end
