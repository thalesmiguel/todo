json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :public, :user_id
  json.url task_url(task, format: :json)
end
