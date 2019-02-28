require 'test_helper'

class WhishlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get whishlists_index_url
    assert_response :success
  end

  test "should get new" do
    get whishlists_new_url
    assert_response :success
  end

  test "should get create" do
    get whishlists_create_url
    assert_response :success
  end

end
