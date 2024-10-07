require "test_helper"

class ConsultationRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get consultation_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get consultation_requests_create_url
    assert_response :success
  end
end
