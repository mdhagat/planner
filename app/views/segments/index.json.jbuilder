json.array!(@segments) do |segment|
  json.extract! segment, :name, :description, :thumbnail, :plan_id
  json.url segment_url(segment, format: :json)
end