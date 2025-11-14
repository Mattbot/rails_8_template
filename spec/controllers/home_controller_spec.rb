require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns app_info" do
      get :index
      expect(assigns(:app_info)).to be_present
      expect(assigns(:app_info)[:name]).to eq(Rails.application.class.parent.name)
      expect(assigns(:app_info)[:version]).to eq(APP_VERSION)
    end
  end
end
