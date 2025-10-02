class DeviceToken < ApplicationRecord
  belongs_to :user, optional: true
  validates :token, presence: true, uniqueness: true
  validates :platform, inclusion: { in: ['ios', 'android'] }
end
