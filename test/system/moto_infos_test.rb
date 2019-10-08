require "application_system_test_case"

class MotoInfosTest < ApplicationSystemTestCase
  setup do
    @moto_info = moto_infos(:one)
  end

  test "visiting the index" do
    visit moto_infos_url
    assert_selector "h1", text: "Moto Infos"
  end

  test "creating a Moto info" do
    visit moto_infos_url
    click_on "New Moto Info"

    fill_in "Is own", with: @moto_info.is_own
    fill_in "Maker name", with: @moto_info.maker_name
    fill_in "Moto name", with: @moto_info.moto_name
    fill_in "Volume", with: @moto_info.volume
    click_on "Create Moto info"

    assert_text "Moto info was successfully created"
    click_on "Back"
  end

  test "updating a Moto info" do
    visit moto_infos_url
    click_on "Edit", match: :first

    fill_in "Is own", with: @moto_info.is_own
    fill_in "Maker name", with: @moto_info.maker_name
    fill_in "Moto name", with: @moto_info.moto_name
    fill_in "Volume", with: @moto_info.volume
    click_on "Update Moto info"

    assert_text "Moto info was successfully updated"
    click_on "Back"
  end

  test "destroying a Moto info" do
    visit moto_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moto info was successfully destroyed"
  end
end
