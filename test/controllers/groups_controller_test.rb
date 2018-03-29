require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit_group" do
    get groups_edit_group_url
    assert_response :success
  end

end
