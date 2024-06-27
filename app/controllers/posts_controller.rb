class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def index
    @post = Post.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :likes ).order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def show
    @new_post = Post.new
    @post = Post.includes(comments: :user).find(params[:id])
    @comment = @post.comments.new
    @user = @comment.user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :index, status: :unprocessable_entity
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
