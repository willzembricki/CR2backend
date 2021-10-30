require "application_system_test_case"

class StatesTest < ApplicationSystemTestCase
  setup do
    @state = states(:one)
  end

  test "visiting the index" do
    visit states_url
    assert_selector "h1", text: "States"
  end

  test "creating a State" do
    visit states_url
    click_on "New State"

    fill_in "Abbv", with: @state.abbv
    fill_in "American indian", with: @state.american_indian
    fill_in "Asian pop", with: @state.asian_pop
    fill_in "Black", with: @state.black
    fill_in "Hawaiian", with: @state.hawaiian
    fill_in "Name", with: @state.name
    fill_in "Pop", with: @state.pop
    fill_in "Unknown", with: @state.unknown
    fill_in "White", with: @state.white
    fill_in "Year", with: @state.year
    click_on "Create State"

    assert_text "State was successfully created"
    click_on "Back"
  end

  test "updating a State" do
    visit states_url
    click_on "Edit", match: :first

    fill_in "Abbv", with: @state.abbv
    fill_in "American indian", with: @state.american_indian
    fill_in "Asian pop", with: @state.asian_pop
    fill_in "Black", with: @state.black
    fill_in "Hawaiian", with: @state.hawaiian
    fill_in "Name", with: @state.name
    fill_in "Pop", with: @state.pop
    fill_in "Unknown", with: @state.unknown
    fill_in "White", with: @state.white
    fill_in "Year", with: @state.year
    click_on "Update State"

    assert_text "State was successfully updated"
    click_on "Back"
  end

  test "destroying a State" do
    visit states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "State was successfully destroyed"
  end
end
