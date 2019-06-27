class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def favorite
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorite_blogs
  end
end