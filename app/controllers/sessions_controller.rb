class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid username/password combo'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
