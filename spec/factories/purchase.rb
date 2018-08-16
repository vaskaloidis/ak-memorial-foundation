FactoryBot.define do
  factory(:purchase) do
    amount BigDecimal.new("150.0")
    product
    user
    note Faker::ChuckNorris.fact
  end
end
