class UsersController < ApplicationController


  def index
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
  end

  def update
  end

  def out
  end

  def quit
  end
end
