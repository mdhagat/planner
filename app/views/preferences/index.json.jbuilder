json.array!(@preferences) do |preference|
  json.extract! preference, :type_of_travelers, :how_you_travel, :what_to_see, :how_long, :which_region, :what_season, :user_id
  json.url preference_url(preference, format: :json)
end