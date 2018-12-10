class CreateGithubs < ActiveRecord::Migration[5.2]
  def change
    create_table :githubs do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.string :u_id
      t.string :username

      t.timestamps
    end
  end
end
