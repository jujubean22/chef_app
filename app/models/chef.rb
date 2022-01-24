class Chef < ApplicationRecord
  validates :location, :contact_number, presence: true

  belongs_to :user
  has_many :service, :report, :gallery
  has_one :wallet
end