class RequestsController < ApplicationController

  load_and_authorize_resource
  
  def new
    @chef = Chef.find(params[:chef_id])
    @balance = current_user.wallet.current_balance if current_user.wallet
    @request = current_user.client.requests.build
  end
end
