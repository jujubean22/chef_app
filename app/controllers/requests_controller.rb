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

    if @request.save
      flash[:notice] = "An request was successfully created"

      Appointment.create(request_id: @request.id,
                      chef_id: @s_chef.id,
                      schedule: Time.now,
                      total_charge: @s_service.service_rate * params[:request][:head_count].to_i
                    )
      redirect_to client_profile_path(current_user.client.id)
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:client_id, :chef_id, :head_count, :cuisine, :notes_to_chef)
  end
end
