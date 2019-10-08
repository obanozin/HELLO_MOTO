require 'test_helper'

class MotoInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moto_info = moto_infos(:one)
  end

  test "should get index" do
    get moto_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_moto_info_url
    assert_response :success
  end

  test "should create moto_info" do
    assert_difference('MotoInfo.count') do
      post moto_infos_url, params: { moto_info: { is_own: @moto_info.is_own, maker_name: @moto_info.maker_name, moto_name: @moto_info.moto_name, volume: @moto_info.volume } }
    end

    assert_redirected_to moto_info_url(MotoInfo.last)
  end

  test "should show moto_info" do
    get moto_info_url(@moto_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_moto_info_url(@moto_info)
    assert_response :success
  end

  test "should update moto_info" do
    patch moto_info_url(@moto_info), params: { moto_info: { is_own: @moto_info.is_own, maker_name: @moto_info.maker_name, moto_name: @moto_info.moto_name, volume: @moto_info.volume } }
    assert_redirected_to moto_info_url(@moto_info)
  end

  test "should destroy moto_info" do
    assert_difference('MotoInfo.count', -1) do
      delete moto_info_url(@moto_info)
    end

    assert_redirected_to moto_infos_url
  end
end
