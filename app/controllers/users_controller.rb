class UsersController < ApplicationController


  def index
    @all_ranks = User.create_all_ranks.limit(3).pluck(:note_id)
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
      @users = @user.followings.page(params[:page]).per(6)
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(6)
    render 'show_follower'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
