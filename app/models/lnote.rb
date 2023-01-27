class Lnote < ApplicationRecord
  belongs_to :lead
  validates :note, presence: true
end
