class TweetsController < ApplicationController

  include TweetsHelper
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = params[:user_id]

    @tweet.save

    redirect_to user_path(@tweet.user)
  end


end
