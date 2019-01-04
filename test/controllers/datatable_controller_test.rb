require 'test_helper'

class DatatableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get datatable_index_url
    assert_response :success
  end

  test "should get show" do
    get datatable_show_url
    assert_response :success
  end

end
