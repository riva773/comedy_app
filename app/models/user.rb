class User < ApplicationRecord
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{7,}\z/

  validates :nickname, presence: true, length: { maximum: 16 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }



end
