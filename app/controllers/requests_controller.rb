class RequestsController < ApplicationController

  load_and_authorize_resource
  
  def new
    @chef = Chef.find(params[:chef_id])
    @balance = current_user.wallet.current_balance if current_user.wallet
    @request = current_user.client.requests.build
  end

  def create
    @request = current_user.client.requests.build(request_params)

    if @request.save
      flash[:notice] = "An request was successfully created"

      Appointment.create(request_id: @request.id,
                      service_id: @request.chef_id,
                      schedule: Time.now)
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
