class Chef < ApplicationRecord
  validates :region, :city, :contact_number, presence: true

  belongs_to :user
  has_many :services
  has_many :appointments
  has_many :reports
  has_many :galleries
  has_one :wallet
end