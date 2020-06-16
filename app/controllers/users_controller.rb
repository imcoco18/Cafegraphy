class UsersController < ApplicationController


  def index
    @all_ranks = User.create_all_ranks
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def out
  end

  def quit
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
