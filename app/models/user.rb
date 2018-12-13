class User < ApplicationRecord

  attr_accessor :remember_token, :activation_token
  before_create :create_activation_digest


  has_many :user_videos
  has_many :videos, through: :user_videos

  has_one  :github
  delegate :token, :u_id, :username, to: :github, prefix: :github, allow_nil: true

  has_many :friendships, dependent: :destroy # use destroy not delete # TODO TRY to push this to db level
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name

  enum role:  [:default, :admin]
  enum activated: [:pending, :active]

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

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    # digest = send("#{attribute}_digest")
    # digest = self.send("#{attribute}_token")
    binding.pry
    return false if digest.nil?
    binding.pry
    # THE ISSUE is that we're passing it the hash token ?
    BCrypt::Password.new(digest).is_password?(token)
    # BCrypt::Password.new(remember_token).is_password?(token)
  end


  private

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def remember
    self.remember_token = User.new_token
    # self.remember_token = activation_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


end
