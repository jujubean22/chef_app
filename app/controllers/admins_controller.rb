class AdminsController < ApplicationController

  load_and_authorize_resource

  def index

  end

  def all_users
    @users = User.all
  end
end
