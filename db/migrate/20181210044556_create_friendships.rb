class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user,   index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: true

      t.timestamps
    end

    # add_foreign_key :friends, :users, column: :friend_user_id
    # add_index :friends, [:user_id, :friend_user_id], unique: true
    add_foreign_key :friends, :users, column: :friend_id
    add_index :friends, [:user_id, :friend_id], unique: true
  end
end
