class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :blogs
  has_many :favorites
  has_many :favorite_blogs, through: :favorites, source: :blog

  def like(blog)
    favorites.find_or_create_by(blog_id: blog.id)
  end

  def unlike(blog)
    favorite = faborites.find_by(blog_id: blog.id)
    favorite.destroy if favorite
  end

  def favorite_to?(blog)
    favorites.where(blog_id: blog.id).exists?
  end
end
