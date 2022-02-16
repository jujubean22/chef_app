require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  context 'validations on creating an admin' do

    it 'must be valid when all fields for chefs are filled up properly' do
      user = User.create(email: 'test@test.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Admin')
      admin = described_class.new(user_id: 1, id: 1)
      expect(admin).to be_valid
    end

    it 'must not be valid when there is no user created' do
      user = described_class.new(id: 1)
      expect(user).not_to be_valid
    end

    it "has one wallet" do
      should respond_to(:wallet) 
    end
  end
end
