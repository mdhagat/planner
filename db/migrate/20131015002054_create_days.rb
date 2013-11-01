class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :day
      t.text :description
      t.integer :segment_id

      t.timestamps
    end
  end
end
