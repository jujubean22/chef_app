class ClientsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def all_chefs
  end

  def profile
    @client = Client.find(params[:id])
  end
end
