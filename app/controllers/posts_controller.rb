class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def top;  end

  def index
    @posts = case params[:sort]
             when 'followers'
               Post.by_followers(current_user).with_likes(current_user).includes(:user)
             when 'popular'
               Post.popular.with_likes(current_user).includes(:user)
             else
               Post.recent.with_likes(current_user).includes(:user)
             end
  end

  def new
    @post = Post.new
  end

  def show
      @new_post = Post.new
      @post = Post.with_likes(current_user).includes(comments: :user).find(params[:id])
      @comment = @post.comments.new
      @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @ogiri_topic = OgiriTopic.find(post_params[:ogiri_topic_id])

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
    params.require(:post).permit(:user_id, :img_url, :content, :ogiri_topic_id)
  end
end
