# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create destroy]

  def index
    @posts = current_user.liked_posts.includes(:user)
  end

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)

    if @like.save
      respond_to do |format|
        format.html { redirect_to @post, notice: 'いいねしました' }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: 'いいねに失敗しました' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("post_#{post.id}_like", partial: 'likes/error', locals: { post: @post }) }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post: @post)

    if @like.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: 'いいねを解除しました' }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, alert: 'いいねの解除に失敗しました' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("post_#{post.id}_like", partial: 'likes/error', locals: { post: @post }) }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
