require 'test_helper'

class PinmapControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pinmap_new_url
    assert_response :success
  end

end
