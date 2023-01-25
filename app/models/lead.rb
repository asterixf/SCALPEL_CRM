class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :orders
  has_many :complaints
  has_many :lead_notes
  validates :status, presence: true
end
