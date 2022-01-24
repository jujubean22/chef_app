class Report < ApplicationRecord
  validates :message, presence: true

  belongs_to :chef
  belongs_to :client
end