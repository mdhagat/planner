json.array!(@activities) do |activity|
  json.extract! activity, :day, :name, :description, :thumbnail, :start_time, :stop_time, :day_id
  json.url activity_url(activity, format: :json)
end