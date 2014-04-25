class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.string :plan_type
      t.text :thumbnail
      t.attachment :avatar
      t.integer :orig_plan_id
      t.integer :user_id

      t.timestamps
    end
  end
end
