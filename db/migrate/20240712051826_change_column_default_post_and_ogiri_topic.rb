class ChangeColumnDefaultPostAndOgiriTopic < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :img_url, from: "#{Rails.root}/app/assets/images/yellow_bg.png", to: "#{Rails.root}/public/images/yellow_bg.png"
    change_column_default :ogiri_topics, :image_url, from: "#{Rails.root}/app/assets/images/yellow_bg.png", to: "#{Rails.root}/public/images/yellow_bg.png"
  end

end
