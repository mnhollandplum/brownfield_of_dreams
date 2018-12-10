
class GithubAccount < ApplicationRecord

  belongs_to :user

  validates_presence_of :github_token

end
