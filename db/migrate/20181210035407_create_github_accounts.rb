class CreateGithubAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :github_accounts do |t|
      t.references :user, foreign_key: true
      t.string     :github_token
      t.string     :github_id
      t.string     :username
      t.string     :avatar

      t.timestamps
    end
  end
end
