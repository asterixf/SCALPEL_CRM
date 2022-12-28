class Customer < ApplicationRecord
  has_many :leads
  has_many :orders, through: :leads
  has_many :complaints, through: :leads
end
