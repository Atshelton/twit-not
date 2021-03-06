class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params["id"])
    @twits = @user.twits
  end

  def create
    @user = User.new
    if @user = User.create(user_params)
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path, notice: "Check your email for a confirmation email"
    else
      render :new
    end
  end

  private def user_params
    params.require("user").permit(:name, :email, :password, :password_confirmation)
  end
end
