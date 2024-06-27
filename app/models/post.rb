class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user,presence: true
  validates :content, presence: true
  validates :privacy, presence: true
  validates :genre, presence: true

  enum genre: { ogiri: 0, manzai: 1, cont: 2, variety_show: 3, gag: 4 }
  enum privacy: { public_access: 0, private_access: 1, follower_only: 2 }

  def likes_by?(user)
    likes.exists?(user_id: user.id)
  end


  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "genre", "id", "privacy", "updated_at", "user_id", "nickname"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
