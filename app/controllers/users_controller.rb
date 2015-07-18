class UsersController < ApplicationController
 
  include UsersHelper
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweet=Tweet.new
    @tweet.user_id=@user.id

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new (user_params)
    @user.save
    flash.notice = "User '#{@user.name}' added!"
    redirect_to user_path(@user)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.notice= "User '#{@user.name} deleted!"
    redirect_to users_path
  end



end
