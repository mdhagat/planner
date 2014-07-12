class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :provider_type
      t.string :street_address1
      t.string :street_address2
      t.string :city
      t.string :state_province
      t.string :country_region
      t.string :pin_zip
      t.string :phone
      t.string :url

      t.timestamps
    end
  end
end
