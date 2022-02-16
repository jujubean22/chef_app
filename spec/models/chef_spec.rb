require 'rails_helper'

RSpec.describe Chef, type: :model do
  context 'validations on creating a chef' do

    it 'must be valid when all fields for chefs are filled up properly' do
      user = User.create(email: 'test@test.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Chef')
      chef = described_class.new(user_id: 1, region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      expect(chef).to be_valid
    end

    it 'must not be valid when there is no user created' do
      user = described_class.new(region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      expect(user).not_to be_valid
    end

    it "has many services, appintments, reports, and galleries" do
      should respond_to(:services) 
      should respond_to(:appointments)
      should respond_to(:reports)
      should respond_to(:galleries)
    end

    it "has one wallet" do
      should respond_to(:wallet) 
    end
  end
end
