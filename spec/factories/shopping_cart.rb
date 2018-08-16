FactoryBot.define do
  factory(:shopping_cart) do
    amount BigDecimal.new("150.0")
    product
    user
  end
end
