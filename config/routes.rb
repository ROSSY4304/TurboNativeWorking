Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/") - THIS IS THE IMPORTANT PART
  root 'home#index'
  
  # Test routes for our app
  get '/test1', to: 'home#test1'
  get '/test2', to: 'home#test2'
  
  # Device token registration for notifications
  post '/device_tokens', to: 'device_tokens#create'
  
  # Test notification endpoint
  post '/test_notification', to: 'notifications#test'
  
  # Turbo Native path configuration
  get '/turbo/ios/path_configuration', to: 'turbo#ios_path_configuration'
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
