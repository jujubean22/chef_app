class HomeController < ApplicationController
  def index
    if user_signed_in?
      @name = current_user.first_name + ' ' + current_user.last_name
      @type = current_user.user_type
    else 
      @name = "Stranger"
    end
    @q = Chef.ransack(params[:q])
    @chef = @q.result(distinct: true)
  end

  def error_page
  end
end

