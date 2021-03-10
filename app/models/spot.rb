class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :users, through: :favorites, dependent: :destroy
  

  def favorited_by?(user)
    Favorite.where(user_id: user).exists?
  end
end
