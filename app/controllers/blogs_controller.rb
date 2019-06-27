class BlogsController < ApplicationController
  before_action :set_blogs, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order("id DESC")
    @ranked_blogs = Blog.order('impressions_count DESC').limit(5)
    @test_blogs = Blog.order("id DESC").limit(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
  end

  def show
    impressionist(@blog, nil)
    # impressionist(@blog, nil, unique: [:session_hash])
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to user_path(current_user.id), notice: "ブログを更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      redirect_to user_path(current_user.id), notice: "ブログを削除しました"
    else
      render user_path(current_user.id)
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :overview, :text, :image).merge(user_id: current_user.id)
  end

  def set_blogs
    @blog = Blog.find(params[:id])
  end
end
