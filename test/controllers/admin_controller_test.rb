require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get quick_purchase_golfer_package" do
    get admin_quick_purchase_golfer_package_url
    assert_response :success
  end

  test "should get quick_purchase_sponsorship" do
    get admin_quick_purchase_sponsorship_url
    assert_response :success
  end

end
