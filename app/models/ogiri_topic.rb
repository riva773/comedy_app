class OgiriTopic < ApplicationRecord
  after_create :generate_image_with_text
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :image_url, presence: true

  def generate_image_with_text
    output_dir = "#{Rails.root}/public/uploads/ogiri_topic/#{self.id}/"
    FileUtils.mkdir_p(output_dir) unless File.directory?(output_dir)

    output_path = "#{output_dir}image.jpg"
    ImageHelper.write(self.content, output_path)

    self.update(image_url: "uploads/ogiri_topic/#{self.id}/image.jpg")
  end
end
