class SessionsController < ApplicationController
  def new
  end

  def create
    if user == User.authenticate_success(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "login successfully"
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', notice: "invalid login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "logout successfully"
  end
end
