require "test_helper"

class Public::RatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_rates_create_url
    assert_response :success
  end
end
