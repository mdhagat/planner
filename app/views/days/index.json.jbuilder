json.array!(@days) do |day|
  json.extract! day, :day, :segment_id
  json.url day_url(day, format: :json)
end