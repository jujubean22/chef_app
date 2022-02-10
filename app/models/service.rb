class Service < ApplicationRecord
  validates :service_rate, presence: true

  belongs_to :chef

  def speciality_with_rate
    "#{specialty} PHP #{service_rate}"
  end
end