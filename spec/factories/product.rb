FactoryGirl.define do
  factory(:product) do
    category "sponsor"
    description "ToFactory: RubyParser exception parsing this attribute"
    name "Tournament Sponsor"
    price BigDecimal.new("5000.0")
  end
end
