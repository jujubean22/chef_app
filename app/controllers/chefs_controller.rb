class ChefsController < ApplicationController

  before_action :set_chef, only: [:profile, :appointments, :edit_chef, :update_chef]

  load_and_authorize_resource

  def index
  end

  def profile
    @galleries = @chef.galleries.where.not(id: nil)
    @gallery = @chef.galleries.build
    @services = @chef.services.where.not(id: nil)
    @service = @chef.services.build
  end

  def appointments
  end

  def edit_chef
  end

  def update_chef
    if @chef.update(chef_params)
      redirect_to chef_profile_path(@chef.id), notice: "A user data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit_chef
    end
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:contact_number, :bio, :region, :city)
  end
end
