json.array!(@profiles) do |profile|
  json.extract! profile, :role, :first_name, :last_name, :street_address1, :street_address2, :city, :state_province, :country_region, :pin_zip, :phone, :email, :secret_question, :secret_answer, :user_id
  json.url profile_url(profile, format: :json)
end