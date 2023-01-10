class Customer < ApplicationRecord
  has_many :leads
  has_many :orders, through: :leads
  has_many :complaints, through: :leads
  validates :name, :phone_number, :email, :address, presence: true
  validates :email, :phone_number, :address, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\z/, message: "-Please eneter a valid email" }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "-Please enter a valid 10 digits number" }
end
