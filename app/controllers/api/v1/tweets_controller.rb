class Api::V1::TweetsController < ApplicationController
  def like
    tweet = Tweet.find(params[:id])
    if tweet.like_by(current_user)
      current_user.tweets.delete(tweet)
      render json: {status: 'removed!'}
    else
      current_user.tweets << tweet
      render json: {status: 'liked!'}
    end
  end
end