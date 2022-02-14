class Service < ApplicationRecord
  validates :service_rate, presence: true

  belongs_to :chef


  def speciality_with_rate
    "#{specialty} - #{ActionController::Base.helpers.number_to_currency(service_rate, unit: "Php", precision: 2, delimiter: ",", format: "%u %n")}"
  end
end
