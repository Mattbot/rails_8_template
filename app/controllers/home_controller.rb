class HomeController < ApplicationController
  def index
    @app_info = {
      name: Rails.application.class.parent.name,
      version: APP_VERSION,
      environment: Rails.env,
      ruby_version: RUBY_VERSION,
      rails_version: Rails::VERSION::STRING
    }
  end
end