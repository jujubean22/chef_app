class Appointment < ApplicationRecord
  validates :schedule, :total_charge, presence: true

  belongs_to :service
  belongs_to :request
  has_one :review
end