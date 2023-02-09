class Onote < ApplicationRecord
  belongs_to :order
  belongs_to :user
  validates :note, presence: true
end
