class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites

  is_impressionable counter_cache: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end