
class User < ApplicationRecord

  has_many :user_videos
  has_many :videos, through: :user_videos

  has_one :github_account
  # (delegate :github_token, to: :github_account)  if self.github_account
  # ^^^ fails if there's no github record


  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password
  has_secure_password

  enum role: [:default, :admin]


  def github_token
    github_account.github_token if github_account
  end

end
