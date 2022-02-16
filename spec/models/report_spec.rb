require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'validations on creating a report' do

    it 'message must be present' do
      user = User.create(email: 'test@test.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Chef')
      user2 = User.create(email: 'test@testt.com', password: '123123', first_name: 'test', last_name: 'test', user_type: 'Client')
      chef = Chef.create(user_id: 1, region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      client = Client.create(user_id: user2.id, region: 'Metro Manila', contact_number: '09774855988', city: 'Amihan')
      report = described_class.new(chef_id: 1, client_id: 2, message: "insensitive")
      expect(report).to be_valid
    end
  end
end
