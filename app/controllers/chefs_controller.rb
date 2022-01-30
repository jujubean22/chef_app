class ChefsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def profile
    @chef = Chef.find(params[:id])
  end
end
