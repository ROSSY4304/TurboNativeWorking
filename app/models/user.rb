class User < ApplicationRecord
  has_many :device_tokens, dependent: :destroy
  
  def add_device_token(token, platform = 'ios')
    device_tokens.find_or_create_by(token: token) do |dt|
      dt.platform = platform
    end
  end
end
