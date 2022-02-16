class ChefsController < ApplicationController

  before_action :set_chef, only: [:profile, :appointments, :edit_chef, :update_chef, :notes_to_chef]
  before_action :set_appointments, only: [:appointments, :notes_to_chef]

  load_and_authorize_resource

def index
  if current_user == nil || current_user.user_type == "Client" 
    if params[:chef][:region].present?
      @chef = Chef.where(region: params[:chef][:region])
      # if @chef.empty?
      #   flash[:notice] = "Sorry no results found."
      # end
    end
  end
  # @chefs = User.where.not(user_type: ['Admin' ,'Client'])
  @all_chefs = Chef.all
end

  def profile
    @galleries = @chef.galleries.where.not(id: nil)
    @gallery = @chef.galleries.build
    @services = @chef.services.where.not(id: nil)
    @service = @chef.services.build
    @appointments = Appointment.where(chef_id: @chef.id)

    @total_rating = 0
    @review_count = 1

    @appointments.each do |a|
      unless a.review.nil?
        @total_rating += a.review.chef_rating
        @review_count += 1
      end
    end

    @total_rating = @total_rating + @chef.rating
<<<<<<< Updated upstream
    rating = (@total_rating/@review_count).round(0)

    @recipe = Recipe::Client.random
=======
    @rating = (@total_rating/@review_count).round(0)
>>>>>>> Stashed changes
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

  def confirm_appointment
    @appointment = Appointment.find(params[:id])
    @appointment.confirmed_at = Time.now
    @appointment.save
    redirect_to chef_appointments_path, notice: 'Successfully confirmed the appointment'
  end

  def notes_to_chef
    @appointment = Appointment.find(params[:id])
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def set_appointments
    @appointments = Appointment.where(chef_id: current_user.chef.id)
  end

  def chef_params
    params.require(:chef).permit(:contact_number, :bio, :region, :city)
  end
end
