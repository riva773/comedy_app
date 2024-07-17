class ImageHelper
  require 'mini_magick'
  require 'securerandom'

  BASE_IMAGE_PATH = "#{Rails.root}/public/images/yellow_bg.png".freeze
  FONT = "#{Rails.root}/app/assets/fonts/DelaSukoGothicOne-R.ttf".freeze
  FONT_SIZE = 36
  TOPIC_FONT_SIZE = 24
  RESPONSE_FONT_SIZE = 20
  INDENTION_COUNT = 14  # 1行あたりの文字数
  ROW_LIMIT = 3  # 最大行数
  LETTER_SPACING = 30  # 文字間隔


  class << self
    def build(text)
      text = prepare_text(text)
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      configuration(text)
      @image
    end

    def build_with_topic_and_response(topic, response)
      topic_text = prepare_text(topic)
      response_text = prepare_text(response)
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      configure_topic_and_response(topic_text, response_text)
      @image
    end

    def write(text, output_path)
      build(text)
      @image.write output_path
    end

    private

    def configuration(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity 'Center'
        config.pointsize FONT_SIZE
        config.draw "text 0,0 '#{text}'"
        config.interword_spacing LETTER_SPACING
      end
    end

    def configure_topic_and_response(topic, response)
      @image.combine_options do |config|
        config.font FONT
        config.gravity 'North'
        config.pointsize TOPIC_FONT_SIZE
        config.draw "text 0,15 '#{topic}'" # 位置を調整
        config.gravity 'South'
        config.pointsize RESPONSE_FONT_SIZE
        config.draw "text 0,30 '#{response}'" # 位置を調整
        config.interword_spacing LETTER_SPACING
      end
    end

    def prepare_text(text)
      text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end
end
