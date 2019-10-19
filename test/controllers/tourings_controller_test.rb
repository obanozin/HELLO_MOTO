require 'test_helper'

class TouringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @touring = tourings(:one)
  end

  test "should get index" do
    get tourings_url
    assert_response :success
  end

  test "should get new" do
    get new_touring_url
    assert_response :success
  end

  test "should create touring" do
    assert_difference('Touring.count') do
      post tourings_url, params: { touring: {  } }
    end

    assert_redirected_to touring_url(Touring.last)
  end

  test "should show touring" do
    get touring_url(@touring)
    assert_response :success
  end

  test "should get edit" do
    get edit_touring_url(@touring)
    assert_response :success
  end

  test "should update touring" do
    patch touring_url(@touring), params: { touring: {  } }
    assert_redirected_to touring_url(@touring)
  end

  test "should destroy touring" do
    assert_difference('Touring.count', -1) do
      delete touring_url(@touring)
    end

    assert_redirected_to tourings_url
  end
end
