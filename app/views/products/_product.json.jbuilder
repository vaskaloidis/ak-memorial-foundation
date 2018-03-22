json.extract! product, :id, :name, :description, :category, :price, :shopping_cart_id, :created_at, :updated_at
json.url product_url(product, format: :json)
