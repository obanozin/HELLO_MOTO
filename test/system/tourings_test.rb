require "application_system_test_case"

class TouringsTest < ApplicationSystemTestCase
  setup do
    @touring = tourings(:one)
  end

  test "visiting the index" do
    visit tourings_url
    assert_selector "h1", text: "Tourings"
  end

  test "creating a Touring" do
    visit tourings_url
    click_on "New Touring"

    click_on "Create Touring"

    assert_text "Touring was successfully created"
    click_on "Back"
  end

  test "updating a Touring" do
    visit tourings_url
    click_on "Edit", match: :first

    click_on "Update Touring"

    assert_text "Touring was successfully updated"
    click_on "Back"
  end

  test "destroying a Touring" do
    visit tourings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Touring was successfully destroyed"
  end
end
