
class Github < ApplicationRecord

  validates_presence_of :u_id
  validates_presence_of :username
  validates_presence_of :token

  belongs_to :user
  # delegate :token, :u_id, :username, to: :user, prefix: :github, allow_nil: true




end
