class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true
  has_many_attached :files
end
