class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_url, notice: 'Tweet created'
    else
      render 'new'
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:user_id, :text)
    end
end
