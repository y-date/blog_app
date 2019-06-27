class FavoritesController < ApplicationController
  # after_action :move_to_root

  def create
    favorite = current_user.favorites.build(blog_id: params[:blog_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end

  # private
  # def move_to_root
  #   redirect_to :root_path and return
  # end
end
