class Admin < ApplicationRecord
  belongs_to :user
  has_one :wallet
end