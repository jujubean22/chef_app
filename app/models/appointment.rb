class Appointment < ApplicationRecord
  belongs_to :chef
  belongs_to :request
  has_one :review, :dependent => :destroy
end