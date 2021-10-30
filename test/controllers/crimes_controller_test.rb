require "test_helper"

class CrimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crime = crimes(:one)
  end

  test "should get index" do
    get crimes_url
    assert_response :success
  end

  test "should get new" do
    get new_crime_url
    assert_response :success
  end

  test "should create crime" do
    assert_difference('Crime.count') do
      post crimes_url, params: { crime: { american_indian: @crime.american_indian, asian_pop: @crime.asian_pop, black: @crime.black, crime_name: @crime.crime_name, hawaiian: @crime.hawaiian, pop: @crime.pop, state_id: @crime.state_id, unknown: @crime.unknown, white: @crime.white, year: @crime.year } }
    end

    assert_redirected_to crime_url(Crime.last)
  end

  test "should show crime" do
    get crime_url(@crime)
    assert_response :success
  end

  test "should get edit" do
    get edit_crime_url(@crime)
    assert_response :success
  end

  test "should update crime" do
    patch crime_url(@crime), params: { crime: { american_indian: @crime.american_indian, asian_pop: @crime.asian_pop, black: @crime.black, crime_name: @crime.crime_name, hawaiian: @crime.hawaiian, pop: @crime.pop, state_id: @crime.state_id, unknown: @crime.unknown, white: @crime.white, year: @crime.year } }
    assert_redirected_to crime_url(@crime)
  end

  test "should destroy crime" do
    assert_difference('Crime.count', -1) do
      delete crime_url(@crime)
    end

    assert_redirected_to crimes_url
  end
end
