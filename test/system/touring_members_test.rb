require "application_system_test_case"

class TouringMembersTest < ApplicationSystemTestCase
  setup do
    @touring_member = touring_members(:one)
  end

  test "visiting the index" do
    visit touring_members_url
    assert_selector "h1", text: "Touring Members"
  end

  test "creating a Touring member" do
    visit touring_members_url
    click_on "New Touring Member"

    click_on "Create Touring member"

    assert_text "Touring member was successfully created"
    click_on "Back"
  end

  test "updating a Touring member" do
    visit touring_members_url
    click_on "Edit", match: :first

    click_on "Update Touring member"

    assert_text "Touring member was successfully updated"
    click_on "Back"
  end

  test "destroying a Touring member" do
    visit touring_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Touring member was successfully destroyed"
  end
end
