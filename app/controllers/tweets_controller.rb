class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @user = @tweet.user.id
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      redirect_to :back
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:user_id, :text)
    end
end
