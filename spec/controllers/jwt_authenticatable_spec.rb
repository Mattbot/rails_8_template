require "rails_helper"

RSpec.describe "JwtAuthenticatable", type: :controller do
  controller(ApplicationController) do
    include JwtAuthenticatable

    before_action :authenticate_jwt_token!

    def index
      render json: { sub: current_jwt_payload["sub"] }
    end
  end

  let(:secret) { "test-secret" }

  around do |example|
    original_secret = ENV["JWT_SECRET"]
    ENV["JWT_SECRET"] = secret
    example.run
  ensure
    ENV["JWT_SECRET"] = original_secret
  end

  before do
    routes.draw { get "index" => "anonymous#index" }
  end

  it "authenticates requests with a valid bearer token" do
    token = JwtService.encode({ "sub" => "user-1" })
    request.headers["Authorization"] = "Bearer #{token}"

    get :index

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to eq("sub" => "user-1")
  end

  it "returns unauthorized when token is missing" do
    get :index

    expect(response).to have_http_status(:unauthorized)
    expect(JSON.parse(response.body)).to eq("error" => "Unauthorized")
  end

  it "returns unauthorized when token is invalid" do
    request.headers["Authorization"] = "Bearer invalid-token"

    get :index

    expect(response).to have_http_status(:unauthorized)
    expect(JSON.parse(response.body)).to eq("error" => "Unauthorized")
  end
end
