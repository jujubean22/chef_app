class Request < ApplicationRecord
  validates :head_count, presence: true

  belongs_to :client
  has_many :appointment
end