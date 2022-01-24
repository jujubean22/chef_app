class Appointment < ApplicationRecord
  validates :schedule, :total_charge, presence: true

  belongs_to :service, :request
  has_one :review
end