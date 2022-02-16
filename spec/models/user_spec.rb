require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {User.new}
  context 'validations' do

    it 'is not allowed without user_type' do
      user = described_class.new(user_type: nil, first_name: "testing", last_name: "user")
      expect(user).not_to be_valid
    end

    it 'does not allow similar username' do
      User.create(:username => 'username')
      user.username = 'username'
      expect(user).not_to be_valid   
    end

  end
end
