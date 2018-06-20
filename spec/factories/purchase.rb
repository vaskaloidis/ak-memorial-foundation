FactoryGirl.define do
  factory(:purchase) do
    amount BigDecimal.new("150.0")
    display nil
    payment_type nil
    product_category "golf_package"
    product_id 8
    user_id nil
  end
end
