json.extract! purchase, :id, :product_id, :user_id, :product_category, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
