require "test_helper"

class Admin::ConsultationRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_consultation_requests_index_url
    assert_response :success
  end
end
