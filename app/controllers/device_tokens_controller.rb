class DeviceTokensController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    # For demo purposes, create a default user
    user = User.first || User.create(name: "Demo User", email: "demo@example.com")
    
    device_token = user.add_device_token(
      params[:token], 
      params[:platform] || 'ios'
    )
    
    if device_token.persisted?
      render json: { status: 'success', message: 'Token registered successfully' }
    else
      render json: { status: 'error', errors: device_token.errors }
    end
  end
end
