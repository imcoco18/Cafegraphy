class PostCommentsController < ApplicationController
	 before_action :authenticate_user!

  def create
  	@post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
    #redirect_to post_path(post)
    else
      @user = @post.user
      @newpost = Post.new
      render template: "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.find_by(post_id: @post.id, id: params[:id])
    @post_comment.destroy
    #redirect_to post_path(params[:post_id])
  end

  private

    def post_comment_params
      params.require(:post_comment).permit(:comment, :post_id, :user_id)
    end
end
