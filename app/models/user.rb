class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :followed
  has_many :followeds, through: :followed_relationships, source: :follower
  has_one_attached :avatar
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{7,}\z/

  validates :nickname, presence: true, length: { maximum: 16 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, if: :password_required?

  def follow(user)
    following_relationships.create!(followed_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def password_required?
    new_record? || password.present?
  end

end
