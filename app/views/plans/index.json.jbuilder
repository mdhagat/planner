json.array!(@plans) do |plan|
  json.extract! plan, :name, :description, :thumbnail, :orig_plan_id, :user_id
  json.url plan_url(plan, format: :json)
end