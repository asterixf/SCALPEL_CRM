class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leads
  has_many :lnotes
  has_many :onotes
  validates :phone_number, :name, presence: true
  validates :email, :phone_number, uniqueness: true
end
