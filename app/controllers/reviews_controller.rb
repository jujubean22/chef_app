class ReviewsController < ApplicationController

  load_and_authorize_resource
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    @appointment = Appointment.find_by(params[:appointment_id])
    # @review = @appointment.build_review
    @chef = Chef.find_by(params[:chef_id])
  end

  def create
    @appointment = Appointment.find_by(params[:appointment_id])
    @review = @appointment.build_review(review_params)

    if @review.save
      flash[:notice] = "An review was successfully created"
      redirect_to client_profile_path(current_user.client.id)
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:appointment_id, :client_comment, :chef_rating, :client_rating)
  end
end
