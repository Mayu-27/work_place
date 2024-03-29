class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots, through: :favorites, dependent: :destroy
  has_one_attached :avatar

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, length: { minimum: 6 }
    validates :password, confirmation: true
    validates :password_confirmation
    validates :birth_date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' } do
    validates :kana_last_name
    validates :kana_first_name
  end

  has_many :reviews, dependent: :destroy
end
