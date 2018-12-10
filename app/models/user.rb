class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  has_one :github
  delegate :token, :u_id, :username, to: :github, prefix: :github, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password
end
