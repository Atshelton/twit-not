class TwitsController < ApplicationController
  def new
    @twit = Twit.new
  end

  def index
    @twits = Twit.all
    @twit = Twit.find_by params[:user_id]
  end

  def show
    @twit = Twit.find(id: params(:user_id))
  end

  def create
    redirect_to twits_path
  end

  private def set_twit
    @twit = Twit.find(params[:id])
  end
end
