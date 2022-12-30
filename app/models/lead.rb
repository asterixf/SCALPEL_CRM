class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :orders
  has_many :complaints
  validates :status, presence: true
end
