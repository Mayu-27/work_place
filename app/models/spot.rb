class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :users, through: :favorites, dependent: :destroy
  
 
  def favorited_by?(user, spot)
    Favorite.where(user_id: user, spot_id: spot).exists?
  end
end
