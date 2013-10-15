class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.text :description
      t.text :thumbnail
      t.integer :plan_id

      t.timestamps
    end
  end
end
