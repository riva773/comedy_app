class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.new
    @user = User.find(params[:id])
    @post_count = @user.posts.count
    @follower_count = @user.followings.count
    @followed_count = @user.followeds.count
  end
end
