class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.text :description
      t.text :thumbnail
      t.integer :orig_segment_id
      t.integer :plan_id
      t.integer :order_in_plan

      t.timestamps
    end
  end
end
