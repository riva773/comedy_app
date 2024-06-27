class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.new
    @user = User.find(params[:id])
  end
end
