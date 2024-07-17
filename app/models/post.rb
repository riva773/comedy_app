class Post < ApplicationRecord
  after_create :generate_image_with_text
  belongs_to :user
  belongs_to :ogiri_topic
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :img_url, presence: true

  scope :recent, -> { order(created_at: :desc)}
  scope :popular, -> { left_joins(:likes).group(:id).order('COUNT(likes.id) DESC') }
  scope :by_followers, ->(user) { where(user_id: user.following_ids) }
  scope :with_likes, ->(user) {
    left_joins(:likes)
      .select("posts.*, COUNT(likes.id) AS likes_count, MAX(CASE WHEN likes.user_id = #{user.id} THEN 1 ELSE 0 END) AS liked_by_user")
      .group('posts.id')
  }

  def likes_count
    likes.size
  end

  def liked_by_user?(user)
    likes.exists?(user_id: user.id)
  end


  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "updated_at", "user_id", "nickname"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def generate_image_with_text
    output_dir = "#{Rails.root}/public/uploads/post/#{self.id}/"
    FileUtils.mkdir_p(output_dir) unless File.directory?(output_dir)

    img = ImageHelper.build_with_topic_and_response(self.ogiri_topic.content, self.content)

    output_path = "#{output_dir}image.jpg"
    img.write(output_path)
    self.update(img_url: "uploads/post/#{self.id}/image.jpg")
  end


end
