class User < ApplicationRecord

  before_save   :downcase_email

  has_many :user_videos
  has_many :videos, through: :user_videos

  has_one :github
  delegate :token, :u_id, :username, to: :github, prefix: :github, allow_nil: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  validates_presence_of :last_name
  enum role: [:default, :admin]
  has_secure_password

  def github_connect(auth)
    github_account = Github.new
    github_account.user = self
    github_account.u_id = auth["uid"]
    github_account.token = auth["credentials"]["token"]
    github_account.save(validate: false)
  end

  def bookmarked_videos
    self.videos
    .order('videos.tutorial_id asc')
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def activate
    update_columns(activated: true)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def tokens_match?(return_token)
    activation_token == return_token
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
