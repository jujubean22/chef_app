class RequestsController < ApplicationController

  load_and_authorize_resource
  
  def new
    @chef = Chef.find(params[:chef_id])
    @balance = current_user.wallet.current_balance if current_user.wallet
    @request = current_user.client.requests.build
  end

  def create
    @request = current_user.client.requests.build(request_params)
    @s_chef = Chef.find_by(id: @request.chef_id)
    @s_service = @s_chef.services.find_by(specialty: @request.cuisine)
    @client_wallet = current_user.wallet if current_user.wallet
    @total_charge = @s_service.service_rate * params[:request][:head_count].to_i

    @client_wallet.current_balance = current_user.wallet.current_balance - @total_charge
    @request.save if @client_wallet.current_balance.positive?

    if @client_wallet.current_balance.positive? && @request.save
      @client_wallet.save
      Appointment.create(request_id: @request.id,
        chef_id: @s_chef.id,
        total_charge: @total_charge
      )
      flash[:notice] = "An request was successfully created"
      redirect_to client_profile_path(current_user.client.id)
    else
      flash[:notice] = "There are some errors encountered"
      redirect_back fallback_location: new_client_request_path(current_user.client.id, chef_id: @s_chef.id)
    end
  end

  private

  def request_params
    params.require(:request).permit(:client_id, :chef_id, :head_count, :cuisine, :notes_to_chef, :schedule)
  end
end
