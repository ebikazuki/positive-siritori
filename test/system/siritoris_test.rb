require "application_system_test_case"

class SiritorisTest < ApplicationSystemTestCase
  setup do
    @siritori = siritoris(:one)
  end

  test "visiting the index" do
    visit siritoris_url
    assert_selector "h1", text: "Siritoris"
  end

  test "creating a Siritori" do
    visit siritoris_url
    click_on "New Siritori"

    fill_in "Score", with: @siritori.score
    fill_in "Word", with: @siritori.word
    click_on "Create Siritori"

    assert_text "Siritori was successfully created"
    click_on "Back"
  end

  test "updating a Siritori" do
    visit siritoris_url
    click_on "Edit", match: :first

    fill_in "Score", with: @siritori.score
    fill_in "Word", with: @siritori.word
    click_on "Update Siritori"

    assert_text "Siritori was successfully updated"
    click_on "Back"
  end

  test "destroying a Siritori" do
    visit siritoris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Siritori was successfully destroyed"
  end
end
