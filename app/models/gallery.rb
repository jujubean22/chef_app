class Gallery < ApplicationRecord
  belongs_to :chef
  has_one_attached :image
end