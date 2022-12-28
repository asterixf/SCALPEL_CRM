class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  validates :status, presence: true
end
