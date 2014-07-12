class SegmentsProviders < ActiveRecord::Migration
  def change
    create_table :segments_providers, :id => false do |t|
      t.integer :segment_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
