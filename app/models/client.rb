class Client < ApplicationRecord
  validates :region, :city, :contact_number, presence: true
  
  belongs_to :user
  has_many :requests
  has_many :reports
  has_one :wallet
end