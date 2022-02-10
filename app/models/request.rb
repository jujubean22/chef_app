class Request < ApplicationRecord
  validates :head_count, presence: true

  belongs_to :client
  has_one :appointment
end