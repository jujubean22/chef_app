class HomeController < ApplicationController
  def index
    if user_signed_in?
      @name = current_user.first_name + ' ' + current_user.last_name   
    else 
      @name = "Stranger"
    end
  end
end

