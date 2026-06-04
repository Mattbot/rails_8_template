require "rails_helper"

RSpec.describe "Version and health endpoints", type: :request do
  before do
    host! "localhost"
  end

  describe "GET /version" do
    it "returns version metadata with git hash" do
      get "/version"

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq("application/json")

      payload = JSON.parse(response.body)
      expect(payload["version"]).to eq(AppVersion.current)
      expect(payload["git_hash"]).to eq(AppVersion.git_hash)
      expect(payload["timestamp"]).to be_present
    end
  end

  describe "GET /api/v1/version" do
    it "returns API version metadata with git hash" do
      get "/api/v1/version"

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq("application/json")

      payload = JSON.parse(response.body)
      expect(payload["version"]).to eq(AppVersion.current)
      expect(payload["git_hash"]).to eq(AppVersion.git_hash)
      expect(payload["timestamp"]).to be_present
    end
  end

  describe "GET /api/v1/health" do
    it "returns API health status" do
      get "/api/v1/health"

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq("application/json")

      payload = JSON.parse(response.body)
      expect(payload).to eq("status" => "ok")
    end
  end

  describe "GET /up" do
    it "returns application health status" do
      get "/up"

      expect(response).to have_http_status(:ok)
    end
  end
end
