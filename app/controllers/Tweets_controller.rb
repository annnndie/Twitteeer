class TweetsController < ApplicationController
  before_action :find_tweet, only: [:show, :destroy]

  def index
    @tweets = current_user.tweets.all
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def find_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

end