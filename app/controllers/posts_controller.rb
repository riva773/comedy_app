class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def index
    @post = Post.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :likes, :tags).order("created_at desc")
    @tag_name = params[:tag_name]
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
    tag_names = params[:tag_name].split(',')
    tags = tag_names.map {| tag_name | Tag.find_or_initialize_by(name: tag_name) }
    tags.each do |tag|
      if tag.invalid?
        @tag_name = params[:tag_name]
        @post.errors.add(:tags, tag.errors.full_message.join("\n"))
        return :index, status: :unprocessable_entity
      end
    end
    if @post.save
      @post.tags = tags
      redirect_to posts_path
    else
      @tag_name = params[:tag_name]
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

  def save_tags(post,tags_string)
    tags=tags_string.split(',').map(&:strip).uniq

    tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        PostTag.create(post: post, tag:tag)
    end
  end


end
