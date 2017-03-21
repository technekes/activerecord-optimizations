json.extract! blog, :id, :body, :title, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
