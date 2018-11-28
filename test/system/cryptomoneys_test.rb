require "application_system_test_case"

class CryptomoneysTest < ApplicationSystemTestCase
  setup do
    @cryptomoney = cryptomoneys(:one)
  end

  test "visiting the index" do
    visit cryptomoneys_url
    assert_selector "h1", text: "Cryptomoneys"
  end

  test "creating a Cryptomoney" do
    visit cryptomoneys_url
    click_on "New Cryptomoney"

    fill_in "Amount Owned", with: @cryptomoney.amount_owned
    fill_in "Cost Per", with: @cryptomoney.cost_per
    fill_in "Symbol", with: @cryptomoney.symbol
    fill_in "User", with: @cryptomoney.user_id
    click_on "Create Cryptomoney"

    assert_text "Cryptomoney was successfully created"
    click_on "Back"
  end

  test "updating a Cryptomoney" do
    visit cryptomoneys_url
    click_on "Edit", match: :first

    fill_in "Amount Owned", with: @cryptomoney.amount_owned
    fill_in "Cost Per", with: @cryptomoney.cost_per
    fill_in "Symbol", with: @cryptomoney.symbol
    fill_in "User", with: @cryptomoney.user_id
    click_on "Update Cryptomoney"

    assert_text "Cryptomoney was successfully updated"
    click_on "Back"
  end

  test "destroying a Cryptomoney" do
    visit cryptomoneys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cryptomoney was successfully destroyed"
  end
end
