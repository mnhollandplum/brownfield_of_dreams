class MoveColumnDataToGithubAccountsTable < ActiveRecord::Migration[5.2]

  def change
    User.find_each do |user|
      GithubAccount.create(
      user_id:      user.id,
      github_token: user.github_token
      )
    end
  end

end
