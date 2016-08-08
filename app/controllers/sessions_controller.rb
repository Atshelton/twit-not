class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params["user"]["email"])

    if @user && @user.authenticate(params["user"]["password"])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}", notice: "You Have successfully logged in!"
    else
      redirect_to new_session_path, notice: "You suck, Try again!"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "You have successfully logged out"
  end
end
