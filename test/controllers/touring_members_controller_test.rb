require 'test_helper'

class TouringMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @touring_member = touring_members(:one)
  end

  test "should get index" do
    get touring_members_url
    assert_response :success
  end

  test "should get new" do
    get new_touring_member_url
    assert_response :success
  end

  test "should create touring_member" do
    assert_difference('TouringMember.count') do
      post touring_members_url, params: { touring_member: {  } }
    end

    assert_redirected_to touring_member_url(TouringMember.last)
  end

  test "should show touring_member" do
    get touring_member_url(@touring_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_touring_member_url(@touring_member)
    assert_response :success
  end

  test "should update touring_member" do
    patch touring_member_url(@touring_member), params: { touring_member: {  } }
    assert_redirected_to touring_member_url(@touring_member)
  end

  test "should destroy touring_member" do
    assert_difference('TouringMember.count', -1) do
      delete touring_member_url(@touring_member)
    end

    assert_redirected_to touring_members_url
  end
end
