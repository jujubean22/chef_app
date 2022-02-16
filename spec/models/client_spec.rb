require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'validations on creating a client' do

    it 'must be valid when all fields for clients are filled up properly' do
      user = User.create(email: 'test@test.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Chef')
      client = described_class.new(user_id: 1, region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      expect(client).to be_valid
    end

    it 'must not be valid when there is no user created' do
      user = described_class.new(region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      expect(user).not_to be_valid
    end

    it "has many requests and reports" do
      should respond_to(:requests) 
      should respond_to(:reports)
    end

    it "has one wallet" do
      should respond_to(:wallet) 
    end
  end
end
