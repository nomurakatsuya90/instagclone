json.extract! picture, :id, :image, :comment, :user_id, :created_at, :updated_at
json.url picture_url(picture, format: :json)
