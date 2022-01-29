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

  after_create :set_role, :create_account
    
  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  def chef?
    has_role?(:chef)
  end

  def create_account
    if self.user_type == 'Admin'
      Admin.create(user: self)
    elsif self.user_type == 'Client'
      Client.create(user: self, location: 'default location', contact_number: '0')
    elsif self.user_type == 'Client'
      Chef.create(user: self, location: 'default location', contact_number: '0')
    end
  end

  def set_role
    if self.user_type == 'Admin'
      self.add_role(:admin)
    elsif self.user_type == 'Client'
      self.add_role(:client)
    elsif self.user_type == 'Chef'
      self.add_role(:chef)
    end
  end
end
