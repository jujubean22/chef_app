class ChefsController < ApplicationController

  load_and_authorize_resource

  def index
    # @chefs = User.where.not(user_type: ['Admin', 'Client']) 
    if params[:chef][:region].present?
        @chef = Chef.where(region: params[:chef][:region])
        if @chef.empty?
          flash[:notice] = "Sorry no results found."
        end
      end
  end

  def profile
    @chef = Chef.find(params[:id])
    @galleries = @chef.galleries.where.not(id: nil)
    @gallery = @chef.galleries.build
    @services = @chef.services.where.not(id: nil)
    @service = @chef.services.build
  end

  def appointments
    @chef = Chef.find(params[:id])
  end
end
