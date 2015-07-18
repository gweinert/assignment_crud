class TweetsController < ApplicationController

  include TweetHelper
  def create
    @tweet = Tweet.new(comment_params)
    @tweet.user_id = params[:user_id]

    @tweet.save

    redirect_to user_path(@tweet.user)
  end


end
