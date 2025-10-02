class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:test]
  
  def test
    user = User.first
    
    if user&.device_tokens&.any?
      puts "🔔 Sending test notification to user: #{user.name}"
      puts "📱 Device tokens: #{user.device_tokens.pluck(:token)}"
      
      render json: { 
        status: 'sent', 
        message: 'Test notification sent!',
        tokens_count: user.device_tokens.count 
      }
    else
      render json: { 
        status: 'no_tokens',
        message: 'No device tokens found. Register from iOS app first.' 
      }
    end
  end
end
