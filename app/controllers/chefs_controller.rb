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
    if @user.wallet
      @wallet = @user.wallet
      @wallet.balance = params[:user][:balance]
      @wallet.save
    end
    if @user.update(user_params)
      redirect_to admin_root_path, notice: "A user data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit_user
    end
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
