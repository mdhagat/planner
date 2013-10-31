json.array!(@providers) do |provider|
  json.extract! provider, :name, :description, :thumbnail, :provider_type, :street_address1, :street_address2, :city, :state_province, :country_region, :pin_zip, :phone, :url
  json.url provider_url(provider, format: :json)
end