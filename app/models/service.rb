class Service < ApplicationRecord
  validates :service_rate, presence: true

  belongs_to :chef
  has_many :appointment
end