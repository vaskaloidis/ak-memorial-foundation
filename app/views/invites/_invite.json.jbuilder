json.extract! invite, :id, :user_id, :golfer_number, :email, :sent_at, :created_at, :updated_at
json.url invite_url(invite, format: :json)
