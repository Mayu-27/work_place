class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :users, through: :favorites, dependent: :destroy
  has_many :reviews

  with_options presence: true do
    validates :shop_name
    validates :address
  end

  def favorited_by?(user, spot)
    Favorite.where(user_id: user, spot_id: spot).exists?
  end
end
