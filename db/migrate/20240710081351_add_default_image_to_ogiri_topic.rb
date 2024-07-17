class AddDefaultImageToOgiriTopic < ActiveRecord::Migration[7.1]
  def change
    change_column_default :ogiri_topics, :image_url, from: nil, to: "#{Rails.root}/app/assets/images/yellow_bg.png"
  end
end
