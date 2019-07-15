require 'test_helper'

class AssociationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get associations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get associations_destroy_url
    assert_response :success
  end

end
