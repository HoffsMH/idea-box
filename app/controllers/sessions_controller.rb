class SessionsController < ApplicationController
  def new

  end

  def create
    user =  User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user] = user.id
      flash[:notice] = "Welcome: #{user.user_name}"
      redirect_to controller: 'welcome', action: 'index'
    else
      flash[:notice] = "Invalid Login"
      redirect_to action: 'new'
    end
  end

  def destroy
    session.delete(:user)
    redirect_to controller: "welcome", action: "index"
  end
end
