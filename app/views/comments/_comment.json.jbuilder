json.extract! comment, :id, :problem_id, :user_id, :description, :created_at, :updated_at
json.url comment_url(comment, format: :json)
