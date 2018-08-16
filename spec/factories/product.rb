FactoryBot.define do
  factory(:product) do
    category "sponsor"
    description {Faker::ChuckNorris.fact}
    name {Faker::ChuckNorris.fact}
    price BigDecimal.new("5000.0")
  end
end
