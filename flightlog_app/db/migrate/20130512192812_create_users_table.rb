class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password_hash

      t.timestamp
    end
  end

  def down
    drop_table :users
  end
end
