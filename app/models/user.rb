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
  has_one :wallet

  after_create :set_role, :create_account
  after_create :intialized_user_wallet
  
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
      Client.create(user: self, region: 'Metro Manila', city: 'Amihan' , contact_number: '09748372837')
    elsif self.user_type == 'Chef'
      Chef.create(user: self)
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

  def intialized_user_wallet
    wallet_amount = Wallet.new(user_id: id, current_balance: 20_000)
    wallet_amount.save
  end
end
