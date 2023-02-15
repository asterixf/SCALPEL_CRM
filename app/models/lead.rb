class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :orders
  has_many :complaints
  has_many :lnotes
  validates :status, presence: true
  validates :status, inclusion:
  { in: ["New", "Going", "Won", "Lost", "Completed"],
    message: "Invalid" }

  include PgSearch::Model

  pg_search_scope :global_search,
    associated_against:
    { customer: [ :name, :phone_number, :email, :address ],
      user: :name
    },
      using:
    {
        tsearch: { prefix: true }
    }
end
