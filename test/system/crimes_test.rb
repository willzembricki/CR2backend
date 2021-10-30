require "application_system_test_case"

class CrimesTest < ApplicationSystemTestCase
  setup do
    @crime = crimes(:one)
  end

  test "visiting the index" do
    visit crimes_url
    assert_selector "h1", text: "Crimes"
  end

  test "creating a Crime" do
    visit crimes_url
    click_on "New Crime"

    fill_in "American indian", with: @crime.american_indian
    fill_in "Asian pop", with: @crime.asian_pop
    fill_in "Black", with: @crime.black
    fill_in "Crime name", with: @crime.crime_name
    fill_in "Hawaiian", with: @crime.hawaiian
    fill_in "Pop", with: @crime.pop
    fill_in "Unknown", with: @crime.unknown
    fill_in "White", with: @crime.white
    fill_in "Year", with: @crime.year
    click_on "Create Crime"

    assert_text "Crime was successfully created"
    click_on "Back"
  end

  test "updating a Crime" do
    visit crimes_url
    click_on "Edit", match: :first

    fill_in "American indian", with: @crime.american_indian
    fill_in "Asian pop", with: @crime.asian_pop
    fill_in "Black", with: @crime.black
    fill_in "Crime name", with: @crime.crime_name
    fill_in "Hawaiian", with: @crime.hawaiian
    fill_in "Pop", with: @crime.pop
    fill_in "Unknown", with: @crime.unknown
    fill_in "White", with: @crime.white
    fill_in "Year", with: @crime.year
    click_on "Update Crime"

    assert_text "Crime was successfully updated"
    click_on "Back"
  end

  test "destroying a Crime" do
    visit crimes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crime was successfully destroyed"
  end
end
