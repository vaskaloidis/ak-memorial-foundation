FactoryGirl.define do
  factory(:shopping_cart) do
    amount BigDecimal.new("150.0")
    product_id 8
    user_id nil
  end
end
