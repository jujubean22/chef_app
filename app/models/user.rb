class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :user_type, :first_name, :last_name, presence: true
  validates :username, uniqueness: true

  has_one :chef
  has_one :client
  has_one :admin
end
