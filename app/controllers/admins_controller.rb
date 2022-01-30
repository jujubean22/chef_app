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
  end

  def transactions
    
  end

  def admin_wallet
    if current_user.wallet
      @balance = current_user.wallet.current_balance
    else
      @balance = '0.00'
    end
  end
end
