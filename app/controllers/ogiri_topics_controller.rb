class OgiriTopicsController < ApplicationController
  def index
    @ogiri_topics = OgiriTopic.all
    @ogiri_topic = OgiriTopic.new
  end

  def show
    @ogiri_topic = OgiriTopic.find(params[:id])
    @post = Post.new
  end

  def create
    @ogiri_topic = OgiriTopic.new(ogiri_topic_params)
    @ogiri_topic.user = current_user

    if @ogiri_topic.save
      redirect_to ogiri_topics_path, notice: "お題の作成に成功しました。"
    else
      render :index
    end
  end


  private

  def ogiri_topic_params
    params.require(:ogiri_topic).permit(:image_url, :content)
  end

end
