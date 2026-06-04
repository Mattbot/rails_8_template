require "rails_helper"

RSpec.describe "ActiveAdmin access", type: :request do
  before do
    host! "localhost"
  end

  it "redirects unauthenticated users to the admin login page" do
    get "/admin", headers: { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" }

    expect(response).to have_http_status(:found)
    expect(response).to redirect_to("/admin/login")
  end
end
