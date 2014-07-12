class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :day
      t.string :name
      t.text :activities
      t.integer :segment_id
      t.integer :order_in_segment

      t.timestamps
    end
  end
end
