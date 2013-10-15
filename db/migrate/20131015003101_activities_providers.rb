class ActivitiesProviders < ActiveRecord::Migration
  def change
    create_table :activities_providers, :id => false do |t|
      t.integer :activity_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
