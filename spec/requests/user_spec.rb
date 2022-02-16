require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe 'GET root path' do

    it 'should get the rootpage' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
    
  end
end
