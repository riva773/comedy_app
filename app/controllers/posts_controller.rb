class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content, :genre, :privacy)
  end
end
