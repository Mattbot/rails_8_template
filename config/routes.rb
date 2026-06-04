Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      get "/" => proc { [ 200, { "Content-Type" => "application/json" }, [ JSON.generate({ status: "ok", version: AppVersion.current, git_hash: AppVersion.git_hash, timestamp: Time.current }) ] ] }
      get "health" => proc { [ 200, { "Content-Type" => "application/json" }, [ JSON.generate({ status: "ok" }) ] ] }
      get "version" => proc { [ 200, { "Content-Type" => "application/json" }, [ JSON.generate({ version: AppVersion.current, git_hash: AppVersion.git_hash, timestamp: Time.current }) ] ] }
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Template homepage - replace this with your actual routes
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Application version endpoint for debugging and monitoring
  get "version" => proc { [ 200, { "Content-Type" => "application/json" }, [ JSON.generate({ version: AppVersion.current, git_hash: AppVersion.git_hash, timestamp: Time.current }) ] ] }

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
