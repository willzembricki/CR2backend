require "application_system_test_case"

class ArrestsTest < ApplicationSystemTestCase
  setup do
    @arrest = arrests(:one)
  end

  test "visiting the index" do
    visit arrests_url
    assert_selector "h1", text: "Arrests"
  end

  test "creating a Arrest" do
    visit arrests_url
    click_on "New Arrest"

    fill_in "Crime", with: @arrest.crime_id
    fill_in "State", with: @arrest.state_id
    click_on "Create Arrest"

    assert_text "Arrest was successfully created"
    click_on "Back"
  end

  test "updating a Arrest" do
    visit arrests_url
    click_on "Edit", match: :first

    fill_in "Crime", with: @arrest.crime_id
    fill_in "State", with: @arrest.state_id
    click_on "Update Arrest"

    assert_text "Arrest was successfully updated"
    click_on "Back"
  end

  test "destroying a Arrest" do
    visit arrests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arrest was successfully destroyed"
  end
end
