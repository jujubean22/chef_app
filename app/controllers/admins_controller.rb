class AdminsController < ApplicationController

  load_and_authorize_resource

  def index

  end

  def all_users
    @users = User.all.where("user_type != ?", 'Admin')
  end

  def reports
    @reports = Report.all
  end

  def appointments
    @appointments = Appointment.all
    @admin_wallet = current_user.wallet
  end

  def release_payment
    @appointment = Appointment.find(params[:id])
    @appointment.payment_released_at = Time.now
    @appointment.save

    total_charge = @appointment.total_charge

    # Admin wallet
    @admin_wallet = current_user.wallet
    @admin_wallet.current_balance = @admin_wallet.current_balance + (total_charge * 0.2)
    # Chef wallet
    @chef_wallet = @appointment.chef.user.wallet
    @chef_wallet.current_balance = @chef_wallet.current_balance + (total_charge * 0.8)
    
    if @appointment.save
      @chef_wallet.save
      @admin_wallet.save
      
      redirect_to admins_appointments_path, notice: 'Successfully release the payment'
    end
  end

  def suspend_chef
    @user = User.find(params[:id])
    @user_chef = Chef.find_by(id: params[:chef_id])
    @user_chef.suspended_at = Time.now
    @user_chef.save
    redirect_to all_users_path, notice: "Successfully suspended the user"
  end

  def unsuspend_chef
    # @user_chef = Chef.find_by(id: params[:chef_id])
    # @user_chef.chef.suspended_at = nil
    # @user_chef.chef.save
    # redirect_to all_users_path, notice: "Successfully unsuspended the user"
  end

  def transactions
    @appointments = Appointment.all
  end

  def admin_wallet
    if current_user.wallet
      @balance = current_user.wallet.current_balance
    else
      @balance = '0.00'
    end
  end
end
