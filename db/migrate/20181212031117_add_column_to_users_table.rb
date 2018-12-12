class AddColumnToUsersTable < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :activated, :integer, :default => 0
    add_column :users, :activation_digest, :string
  end

end
