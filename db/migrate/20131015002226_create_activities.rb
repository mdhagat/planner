class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.date :day
      t.string :name
      t.text :description
      t.text :thumbnail
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :day_id

      t.timestamps
    end
  end
end
