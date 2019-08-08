require 'test_helper'

class LivehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get livehouses_new_url
    assert_response :success
  end

  test "should get edit" do
    get livehouses_edit_url
    assert_response :success
  end

  test "should get show" do
    get livehouses_show_url
    assert_response :success
  end

  test "should get index" do
    get livehouses_index_url
    assert_response :success
  end

end
