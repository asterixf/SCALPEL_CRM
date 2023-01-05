class Customer < ApplicationRecord
  has_many :leads
  has_many :orders, through: :leads
  has_many :complaints, through: :leads
  validates :name, :phone_number, :email, :address, presence: true
  validates :email, :phone_number, :address, uniqueness: true
end
