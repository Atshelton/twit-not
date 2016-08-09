class TwitsController < ApplicationController
  def new
    @twit = Twit.new
  end

  def index
    @twits = Twit.all
    @twit = Twit.where params[:user_id]
  end

  def show
    @twit = Twit.find(id: params(:user_id))
  end

  def create
    @twit = Twit.new(twit_params)
    if @twit.save
      @twit.update(user_id: current_user.id)
      redirect_to twits_path
    else
      render :new
    end
  end

  private def twit_params
    params.require("twit").permit(:body)

  end
end
