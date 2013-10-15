class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :street_address1
      t.string :street_address2
      t.string :city
      t.string :state_province
      t.string :country_region
      t.string :pin_zip
      t.string :phone
      t.string :email
      t.string :secret_question
      t.string :secret_answer
      t.integer :user_id

      t.timestamps
    end
  end
end
