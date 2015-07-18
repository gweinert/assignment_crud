class TweetsController < ApplicationController

  include TweetsHelper
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = params[:user_id]

    @tweet.save

    redirect_to user_path(@tweet.user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @user = User.find(params[:user_id])
    # @tweet.user_id = params[:user_id]
    # redirect_to edit_user_tweet_path(@tweet.user_id, @tweet)
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.user_id = params[:user_id]
    @tweet.update(tweet_params)

    redirect_to user_path(@tweet.user)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user_id = params[:user_id]

    tweet.destroy

    redirect_to user_path(user_id)
  end


end
