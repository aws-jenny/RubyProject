require 'test_helper'

class ExamHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exam_histories_index_url
    assert_response :success
  end

end
