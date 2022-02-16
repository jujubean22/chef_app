require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations on creating a user' do

    it 'must be valid when all fields are filled up properly' do
      user = described_class.new(email: 'test@test.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Chef')
      expect(user).to be_valid
    end

    it 'does not allow creation without user_type' do
      user = described_class.new(user_type: nil, first_name: "testing", last_name: "user")
      expect(user).not_to be_valid
    end

    it 'does not allow creation without first_name' do
      user = described_class.new(user_type: 'Chef', first_name: nil, last_name: "user")
      expect(user).not_to be_valid
    end

    it 'does not allow creation without last_name' do
      user = described_class.new(user_type: 'Chef', first_name: "testing", last_name: nil)
      expect(user).not_to be_valid
    end

    it 'does not allow similar username' do
      user = described_class.new(:username => 'username')
      user.username = 'username'
      expect(user).not_to be_valid   
    end

  end

  context 'User wallet' do
    
    it 'user has a wallet after create' do
      user = User.create(email: 'rspectest@example.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Chef')
      expect(user.wallet).not_to be_nil
    end
    
    it 'user wallet has 20,000 balance' do
      user = User.create(email: 'rspectest@example.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Client')
      expect(user.wallet.current_balance).to eq(20_000)
    end
  end

end


