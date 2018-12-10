
class GithubAccount < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates_presence_of :github_token
  validates_presence_of :username
  validates_presence_of :u_id
  # validates :u_id, uniqueness: true, presence: true
  # TODO - Test uniqueness

end
