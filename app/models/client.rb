class Client < ApplicationRecord
  validates :location, :contact_number, presence: true
  
  belongs_to :user
  has_many :request, :report
  has_one :wallet
end