class CreateSessionsTable < ActiveRecord::Migration
  def up
    create_table :sessions do |t|
      t.integer :user_id
      t.string :session_id
      t.datetime :expires

      t.timestamp
    end
  end

  def down
    drop_table :sessions
  end
end
