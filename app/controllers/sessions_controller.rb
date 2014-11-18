class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # valid login/password
      session[:id] = user.id
      redirect_to root_path,
                  notice: "Welcome back #{user.first_name.titleize}"
    else
      # invalid login or password
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end
end
