class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :type_of_travelers
      t.integer :how_you_travel
      t.integer :what_to_see
      t.integer :how_long
      t.integer :which_region
      t.integer :what_season
      t.integer :user_id

      t.timestamps
    end
  end
end
