class PostsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @posts = Post.page(params[:page]).per(6).order(id: "DESC")
    @all_ranks = Post.create_all_ranks
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    like = Like.find_by(user_id: current_user.id, post_id: params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    #キーワード
    @q = Post.ransack(params[:q])
    @results = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(10)
    #タグ
    #@tag_search = Post.tagged_with(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :title, :shop_name, :category_id, :comment, tag_ids: [])
  end

  def search_params
    params.require(:q).permit!
  end
end
