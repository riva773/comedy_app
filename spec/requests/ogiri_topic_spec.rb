require 'rails_helper'

RSpec.describe "OgiriTopics", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/ogiri_topic/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ogiri_topic/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/ogiri_topic/index"
      expect(response).to have_http_status(:success)
    end
  end

end
