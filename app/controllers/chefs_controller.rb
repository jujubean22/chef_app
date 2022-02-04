class ChefsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def profile
    @chef = Chef.find(params[:id])
    @galleries = @chef.galleries.where.not(id: nil)
    @gallery = @chef.galleries.build
  end

  def appointments
    @chef = Chef.find(params[:id])
  end
end
