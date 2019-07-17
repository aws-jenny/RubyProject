require 'test_helper'

class UserTrainingRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_training_records_index_url
    assert_response :success
  end

end
