class CreateLogsTable < ActiveRecord::Migration
  def up
    create_table :logs do |t|
      t.string :plane_tail
      t.string :plane_model
      t.string :routes
      t.integer :num_instruments
      t.integer :num_landings
      t.decimal :single_engine_hours
      t.decimal :multi_engine_hours
      t.decimal :cross_country_hours
      t.decimal :day_hours
      t.decimal :night_hours
      t.decimal :ifr_hours
      t.decimal :simulated_ifr_hours
      t.decimal :ground_trainer_hours
      t.decimal :dual_received_hours
      t.decimal :pic_hours

      t.timestamp
    end
  end

  def down
    drop_table :logs
  end
end
