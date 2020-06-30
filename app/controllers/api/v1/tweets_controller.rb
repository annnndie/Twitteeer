class Api::V1::TweetsController < ApplicationController
  def like
    tweet = Tweet.find(params[:id])
    # byebug
    if tweet.like_by(current_user)
      current_user.i_like_tweets.delete(tweet)
      render json: {status: 'removed!'}
    else
      current_user.i_like_tweets << tweet
      render json: {status: 'liked!'}
    end
  end
end