class Appointment < ApplicationRecord
  validates :schedule, presence: true

  belongs_to :chef
  belongs_to :request
  has_one :review, :dependent => :destroy
end