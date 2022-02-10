class ClientsController < ApplicationController

  before_action :set_client, only: [:profile, :edit_client, :update_client]

  load_and_authorize_resource

  def index
  end

  def all_chefs
    @chefs = User.where.not(user_type: ['Admin' ,'Client'])
  end

  def profile
    if current_user.user_type == 'Client'
      @requests = Request.where(client_id: current_user.client.id)
      @requests_array = @requests.map{|req| req.id}
      @appointments = Appointment.where(request_id: @requests_array)
    end
  end

  def edit_client
  end

  def update_client
    if @client.update(client_params)
      redirect_to client_profile_path(@client.id), notice: "A user data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit_client
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:contact_number, :region, :city)
  end
  
end
