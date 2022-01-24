class Review < ApplicationRecord
  validates :client_comment, :chef_rating, presence: true

  belongs_to :appointment
end