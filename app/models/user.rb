
class User < ApplicationRecord

  has_many :user_videos
  has_many :videos, through: :user_videos

  has_one :github_account
  delegate :github_token, to: :github_account, allow_nil: true

  # has_many :friendships, foreign_key: true, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships #, source: :friend


  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password
  has_secure_password

  enum role: [:default, :admin]


end
